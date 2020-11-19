// To parse this JSON data, do
//
//     final version = versionFromJson(jsonString);

import 'dart:convert';

List<Version> versionFromJson(List<dynamic> versionsJSONList) => List<Version>.from(versionsJSONList.map((x) => Version.fromJson(x)));

String versionToJson(List<Version> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Version {
  Version({
    this.id,
    this.projectId,
    this.commitMessage,
    this.uploaded,
  });

  int id;
  int projectId;
  String commitMessage;
  DateTime uploaded;

  factory Version.fromJson(Map<String, dynamic> json) => Version(
    id: json["id"],
    projectId: json["project_id"],
    commitMessage: json["commit_message"],
    uploaded: DateTime.parse(json["uploaded"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_id": projectId,
    "commit_message": commitMessage,
    "uploaded": uploaded.toIso8601String(),
  };
}
