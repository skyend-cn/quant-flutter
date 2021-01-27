import 'package:flutter/material.dart';
import 'package:quant/kchart/entity/k_line_entity.dart';
import 'package:quant/kchart/kline_data_controller.dart';
import 'package:quant/kchart/kline_vertical_widget.dart';
import 'package:quant/kchart/state_enum.dart';
import 'package:quant/kchart/utils/data_util.dart';
import 'package:quant/utils/global.dart';

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String symbol = "BABA";
  List<KLineEntity> data = [];
  bool showLoading = true;
  KLineDataController dataController = KLineDataController();

  @override
  void initState() {
    super.initState();
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
        title:Text(symbol),
      ),
      body: Stack(
        children: [
          KLineVerticalWidget(datas: data, dataController: dataController),
          Offstage(
            offstage: !showLoading,
            child:  Container(
                width: double.infinity,
                height: 450,
                alignment: Alignment.center,
                child: CircularProgressIndicator()
            ),
          ),
        ],
      ),
    );
  }

  void getData(String period) async {
    setState(() {
      showLoading = true;
    });

    var response = await G.req.stock.history(symbol: symbol);
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
