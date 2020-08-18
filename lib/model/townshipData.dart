class township {
  List<Data> data;

  township({this.data});

  township.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String stateDivision;
  String pCode;
  Townships townships;

  Data({this.id, this.stateDivision, this.pCode, this.townships});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateDivision = json['state_division'];
    pCode = json['p_code'];
    townships = json['townships'] != null
        ? new Townships.fromJson(json['townships'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state_division'] = this.stateDivision;
    data['p_code'] = this.pCode;
    if (this.townships != null) {
      data['townships'] = this.townships.toJson();
    }
    return data;
  }
}

class Townships {
  int total;
  String view;

  Townships({this.total, this.view});

  Townships.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['view'] = this.view;
    return data;
  }
}