

class SampleApiRes {
    int? status;
    String? message;
    List<Datum>? data;

    SampleApiRes({
        this.status,
        this.message,
        this.data,
    });

    factory SampleApiRes.fromJson(Map<String, dynamic> json) => SampleApiRes(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? name;
    String? role;

    Datum({
        this.id,
        this.name,
        this.role,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
    };
}
