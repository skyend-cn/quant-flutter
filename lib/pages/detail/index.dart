import 'package:flutter/material.dart';
import 'package:quant/jsonserialize/stock/data.dart';
import 'package:quant/kchart/entity/k_line_entity.dart';
import 'package:quant/kchart/kline_data_controller.dart';
import 'package:quant/kchart/kline_vertical_widget.dart';
import 'package:quant/kchart/state_enum.dart';
import 'package:quant/kchart/utils/data_util.dart';
import 'package:quant/utils/global.dart';
import 'package:quant/utils/logger.dart';
import 'package:quant/values/string.dart' as res;

class Detail extends StatefulWidget {
  final StockData stock;

  Detail({Key key, @required this.stock}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List<KLineEntity> data = [];
  bool showLoading = true;
  KLineDataController dataController = KLineDataController();

  @override
  void initState() {
    super.initState();
    Logger.v(widget.stock.toJson());
    getData(dataController.periodModel.period);
    dataController.changePeriodClick = (KLinePeriodModel model) {
      getData(model.period);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E2034),
      appBar: AppBar(
        backgroundColor: Color(0xFF0E1925),
        title: Text(widget.stock.symbol),
      ),
      body: Stack(
        children: [
          KLineVerticalWidget(datas: data, dataController: dataController),
          Offstage(
            offstage: (MediaQuery.of(context).orientation != Orientation.portrait) || showLoading ,
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 3 / 5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      res.Strings.pe,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    constraints: BoxConstraints(
                                             maxWidth: 55,
                                          ),
                                    child: Text(
                                      widget.stock.pe.toStringAsFixed(2),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: Text(
                                      res.Strings.pb,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 55,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.stock.getPb().toStringAsFixed(2),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: Text(
                                      res.Strings.beta,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: 55,
                                    ),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.stock.beta.toStringAsFixed(2),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      res.Strings.eps,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.stock.eps.toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: Text(
                                      res.Strings.book_value,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.stock.bookValue.toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      res.Strings.peg,
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      widget.stock.peg.toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: Text(
                                      res.Strings.holder_change + "(%)",
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                        (widget.stock.getHolderChanged() * 100).toStringAsFixed(2),
                                      style: TextStyle(
                                          color: Colors.white60, fontSize: 17),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Offstage(
            offstage: !showLoading,
            child: Container(
                width: double.infinity,
                height: 450,
                alignment: Alignment.center,
                child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  void getData(String period) async {
    setState(() {
      showLoading = true;
    });

    var response = await G.req.stock.history(symbol: widget.stock.symbol);
    data.clear();
    for (var o in response.data['data']) {
      KLineEntity kLineEntity = KLineEntity.fromJson(o);
      kLineEntity.date = kLineEntity.date.split(" ")[0];
      data.add(kLineEntity);
    }
    data = data.reversed.toList();
    DataUtil.calculate(data);
    showLoading = false;
    setState(() {});
  }
}
