class Constant {
  static final String KEY_USER = "user";

  static final String SALT = "cdadf3ad1c6653a43f1b56d640a509d9";
}

class Label {
  final String title;
  final String label;

  Label({this.title, this.label});

  static Label PE = Label(title: "市盈率", label: "pe");
  static Label PB = Label(title: "市净率", label: "pb");
  static Label RISK = Label(title: "风险", label: "risk");
  static Label INC = Label(title: "涨幅", label: "inc");
  static Label DEC = Label(title: "跌幅", label: "dec");
  static Label QC = Label(title: "QC指数", label: "qc");
  static Label QF = Label(title: "QF指数", label: "qf");
  static Label HOLDERS = Label(title: "机构变动", label: "holders");
  static Label INSIDE = Label(title: "内部持股变动", label: "inside");

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
