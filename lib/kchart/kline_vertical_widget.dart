import 'package:flutter/material.dart';
import 'package:quant/kchart/state_enum.dart';
import 'entity/k_line_entity.dart';
import 'kchat_widget.dart';
import 'kline_indicators_widget.dart';
import 'kline_data_controller.dart';

class KLineVerticalWidget extends StatefulWidget {
  KLineVerticalWidget({@required this.datas, this.dataController});

  KLineDataController dataController;
  List<KLineEntity> datas = [];

  @override
  State<StatefulWidget> createState() {
    return _KLineVerticalWidgetState();
  }
}

class _KLineVerticalWidgetState extends State<KLineVerticalWidget>
    with TickerProviderStateMixin {
  KLineDataController dataController;

  @override
  void initState() {
    super.initState();
    dataController = widget.dataController;
  }

  @override
  Widget build(BuildContext context) {
    return KLineDataWidgetController(
      dataController: dataController,
      child: Column(
        children: <Widget>[
          KlineIndicatorsWidget(
              mainStates: dataController.mainStates,
              secondaryStates: dataController.secondaryStates,
              hideClick: () {

              }),
          Builder(builder: (BuildContext context) {
            return Expanded(
                child: Stack(
              children: <Widget>[
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width,
                  child: KChartWidget(
                    widget.datas,
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    isLine: KLineDataWidgetController.of(context).isLine,
                    mainState: dataController.mainState,
                    secondaryState: dataController.secondaryState,
                    volState: VolState.VOL,
                    fractionDigits: 2,
                  ),
                )
              ],
            ));
          }),
        ],
      ),
    );
  }
}
