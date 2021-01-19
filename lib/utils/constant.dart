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

  static List<Label> values = [PE, PB, RISK, INC, DEC];

  static Label fromString(String label) {
    for (Label o in values) {
      if (o.label == label) {
        return o;
      }
    }
    return null;
  }
}
