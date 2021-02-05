import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quant/generated/l10n.dart';
import 'package:quant/jsonserialize/stock/data.dart';
import 'package:quant/utils/constant.dart';
import 'package:quant/utils/global.dart';
import 'package:quant/utils/logger.dart';

class StockListView extends StatefulWidget {
  final String _label;

  StockListView(this._label);

  @override
  State<StatefulWidget> createState() => _StockListViewState(_label);
}

class _StockListViewState extends State<StockListView>
    with AutomaticKeepAliveClientMixin {
  final String _label;

  List<StockData> _stocks = [];

  _StockListViewState(this._label);

  bool _isZh = false;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _isZh = G.getCurrentLocale().languageCode == "zh";
    _onRefresh();
  }

  void _onRefresh() async {
    Logger.v("_onRefresh");

    var res = await G.req.stock.quant(label: _label);
    _stocks.clear();
    for (var o in res.data['data']) {
      StockData stock = StockData.fromJson(o);
      _stocks.add(stock);
    }
    setState(() {
      _stocks = _stocks;
    });
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: _bodyBuilder(),
      ),
    );
  }

  Widget _bodyBuilder() {
    if (_stocks.isEmpty) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    } else {
      return SmartRefresher(
        enablePullDown: true,
        header: G.pullToRefreshStyle.header(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView.separated(
            itemBuilder: (context, index) => _itemBuilder(context, index),
            itemCount: _stocks.length + 1,
            separatorBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container();
              }
              return Divider(height: 1.0);
            }),
      );
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == 0) {
      return _itemTitleBuilder();
    } else {
      return _itemContentBuilder(index - 1);
    }
  }

  Widget _itemTitleBuilder() {
    String title = S.of(context).stock_list_name;
    String label;
    String chg = S.of(context).stock_list_chg;

    Label l = Label.fromString(_label);
    label = l.title;

    if (_label == Label.INC.label ||
        _label == Label.DEC.label ||
        _label == Label.QC.label ||
        _label == Label.QF.label) {
      label = "";
    }

    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 15, bottom: 2),
          child: Text(title),
        ),
        Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 15, bottom: 2),
            child: Text(chg)),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 120, bottom: 2),
          child: Text(label),
        ),
      ],
    );
  }

  Widget _itemContentBuilder(int index) {
    StockData stock = _stocks[index];

    String title = _isZh ? stock.cnName : stock.name;
    String symbol = stock.symbol;
    String label = "";
    String chg = stock.chg.toString() + '%';

    if (_label == Label.PE.label) {
      label = stock.pe.toStringAsFixed(2);
    } else if (_label == Label.PB.label) {
      label = stock.getPb().toStringAsFixed(2);
    } else if (_label == Label.RISK.label) {
      label = stock.getRisk().toStringAsFixed(2);
    } else if (_label == Label.INC.label) {
      label = "";
    } else if (_label == Label.DEC.label) {
      label = "";
    } else if (_label == Label.QC.label) {
      label = "";
    } else if (_label == Label.QF.label) {
      label = "";
    } else if (_label == Label.HOLDERS.label) {
      label = stock.getHolderChanged().toStringAsFixed(2);
    } else if (_label == Label.INSIDE.label) {
      label = stock.lastTenDaysInsideChangeFund.toStringAsFixed(2);
    }

    return InkWell(
      onTap: () {
        Logger.v("tap: " + stock.toString());
        G.pushNamed('/detail', arguments: stock);
      },
      child: Stack(
        children: [
          Container(
            height: 48,
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  margin: EdgeInsets.only(left: 15, top: 2),
                  child: Text(
                    symbol,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 48,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 15),
            child: Text(chg),
          ),
          Container(
            height: 48,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 120),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
