const testbunimg =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh5frP2WUiJbwPVf2Af1wi8sRmAggvSfXCzw&usqp=CAU";

const guserimg =
    "https://www.clipartmax.com/png/middle/319-3191274_male-avatar-admin-profile.png";

const addtumb =
    "https://firebasestorage.googleapis.com/v0/b/smartfair-fe0af.appspot.com/o/init%2Fadvertisement.png?alt=media&token=a16dcc2a-3813-40ee-96af-71e63ef21990";

const userimagebucket = "images/users";
const postimagebucket = "images/posts/";

const int resok = 1;
const int resfail = 0;
const String sucesscode = "sucessfull";

const String nodata = "nodata";

class CollectionPath {
  static const teampath = "Team/";
  static const initdata = "/initdata/";
  static const matchsround1 = "/matchs/round1/data";
  static const matchpathsemi = "/matchs/semi/data/";
  static const matchpathfinal = "/matchs/final/data/";
  static const grouppath = "initdata/groups/data";
  static const matchdatapath = "/initdata/matchdata";
  static const matchpath = "/matchs/round1/data/";
  static String ballpath(String matchid) {
    String path = "/matchs/round1/data/$matchid/ball";

    return path;
  }
}

class Resultype {
  static const wicket = "W";
  static const iDilivary = "I";
  static const marks = "R";
}

class Matchstatustype {
  static const ongoning = "ongoning";
  static const notstared = "notstared";
  static const end = "end";
  static const noresult = "nr";
  static const draw = "draw";
}

class Matchtype {
  static const round1 = "round1";
  static const semi = "semi";
  static const finalm = "final";
}

class Idelivertype {
  static const wide = "WB";
  static const noball = "NB";
  static const dead = "DB";
  static const legbyes = "LB";
  static const byes = "BY";
  static const noex = "NOex";
}

class Wickettype {
  static const bowled = "BO";
  static const stump = "SO";
  static const runout = "RO";
  static const hitwicket = "HW";
  static const catchout = "CO";
  static const out = "OUT";
  static const notout = "NOTOUT";
}

class Marktype {
  static const six = "6M";
  static const four = "4M";
  static const boundarysix = "6MB";
  static const boundaryfour = "4MB";
  static const five = "5M";
  static const dot = "0M";
  static const one = "1M";
  static const two = "2M";
  static const three = "3M";
}

String getpossition(String role) {
  int r = int.parse(role);

  if (r == 0) {
    return "Farmer";
  } else if (r == 1) {
    return "Field Officer";
  } else if (r == 2) {
    return "Expert";
  } else {
    return "Unknown";
  }
}
