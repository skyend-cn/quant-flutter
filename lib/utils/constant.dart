import 'package:quant/values/string.dart' as res;

class Constant {
  static final String KEY_USER = "user";

  static final String SALT = "cdadf3ad1c6653a43f1b56d640a509d9";
}

class Label {
  final String title;
  final String label;

  Label({this.title, this.label});

  static Label PE = Label(title: res.Strings.pe, label: "pe");
  static Label PB = Label(title: res.Strings.pb, label: "pb");
  static Label RISK = Label(title: res.Strings.risk, label: "risk");
  static Label INC = Label(title: res.Strings.inc, label: "inc");
  static Label DEC = Label(title: res.Strings.dec, label: "dec");
  static Label QC = Label(title: res.Strings.qc, label: "qc");
  static Label QF = Label(title: res.Strings.qf, label: "qf");
  static Label HOLDERS = Label(title: res.Strings.holder_change, label: "holders");
  static Label INSIDE = Label(title: res.Strings.inside_change, label: "inside");

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
