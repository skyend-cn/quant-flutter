import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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

class _StockListViewState extends State<StockListView> {
  final String _label;

  List<StockData> _stocks = [];

  _StockListViewState(this._label);

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

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
        child: ListView.builder(
          itemBuilder: (context, index) => _itemBuilder(context, index),
          itemCount: (_stocks.length + 1) * 2,
        ),
      );
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == 1) {
      return Container();
    }
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    if (index == 0) {
      return _itemTitleBuilder();
    } else {
      return _itemContentBuilder(index - 1);
    }
  }

  Widget _itemTitleBuilder() {
    String title = "名称";
    String label;
    String chg = "涨跌幅";

    Label l = Label.fromString(_label);
    label = l.title;

    if (_label == Label.INC.label || _label == Label.DEC.label) {
      label = "";
    }

    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 15, bottom: 8),
          child: Text(title),
        ),
        Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 15, bottom: 8),
            child: Text(chg)),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 120, bottom: 8),
          child: Text(label),
        ),
      ],
    );
  }

  Widget _itemContentBuilder(int index) {
    StockData stock = _stocks[index];

    String title = stock.cnName;
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
      label = index.toString();
    } else if (_label == Label.QF.label) {
      label = index.toString();
    } else if (_label == Label.HOLDERS.label) {
      label = stock.getHolderChanged().toStringAsFixed(2);
    } else if (_label == Label.INSIDE.label) {
      label = stock.lastTenDaysInsideChangeFund.toStringAsFixed(2);
    }

    return Stack(
      children: [
        Container(
          height: 34,
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
          height: 34,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 15),
          child: Text(chg),
        ),
        Container(
          height: 34,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 120),
          child: Text(label),
        ),
      ],
    );
  }
}
