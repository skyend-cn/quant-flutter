import 'package:quant/generated/l10n.dart';
import 'package:quant/utils/global.dart';

class Constant {
  static final String KEY_USER = "user";

  static final String SALT = "cdadf3ad1c6653a43f1b56d640a509d9";
}

class Label {
  final String title;
  final String label;

  Label({this.title, this.label});

  static Label PE = Label(title: S.of(G.getCurrentContext()).pe, label: "pe");
  static Label PB = Label(title: S.of(G.getCurrentContext()).pb, label: "pb");
  static Label RISK =
      Label(title: S.of(G.getCurrentContext()).risk, label: "risk");
  static Label INC =
      Label(title: S.of(G.getCurrentContext()).inc, label: "inc");
  static Label DEC =
      Label(title: S.of(G.getCurrentContext()).dec, label: "dec");
  static Label QC = Label(title: S.of(G.getCurrentContext()).qc, label: "qc");
  static Label QF = Label(title: S.of(G.getCurrentContext()).qf, label: "qf");
  static Label HOLDERS =
      Label(title: S.of(G.getCurrentContext()).holder_change, label: "holders");
  static Label INSIDE =
      Label(title: S.of(G.getCurrentContext()).inside_change, label: "inside");

  static List<Label> values = [PE, PB, RISK, INC, DEC, QC, QF, HOLDERS, INSIDE];

  static Label fromString(String label) {
    for (Label o in values) {
      if (o.label == label) {
        return o;
      }
    }
    return null;
  }
}
