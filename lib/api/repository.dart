import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/resources.dart';
import '../models/subject.dart';
import '../models/announcement.dart';
import '../models/class_model.dart';
import '../models/attendance.dart';

class DataRepository {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();
  static const _baseUrl = "http://<YOUR_BACKEND_IP>:3000";

  static List<Subject> subjects = [];
  static List<Announcement> announcements = [];
  static List<ClassModel> classes = [];
  static List<Resource> resources = [];
  static List<Attendance> attendance = [];

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> fetchSubjects() async {
    final token = await _getToken();
    final res = await http.get(Uri.parse("$_baseUrl/api/student/subjects"),
        headers: {'Authorization': 'Bearer $token'});

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['subjects'];
      subjects = (data as List).map((e) => Subject.fromJson(e)).toList();
      await _storage.write(
          key: 'subjects',
          value: jsonEncode(subjects.map((e) => e.toJson()).toList()));
    }
  }

  static Future<void> fetchAnnouncements() async {
    final token = await _getToken();
    final res = await http.get(Uri.parse("$_baseUrl/api/student/announcements"),
        headers: {'Authorization': 'Bearer $token'});

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['announcements'];
      announcements =
          (data as List).map((e) => Announcement.fromJson(e)).toList();
      await _storage.write(
          key: 'announcements',
          value: jsonEncode(announcements.map((e) => e.toJson()).toList()));
    }
  }

  static Future<void> fetchClasses() async {
    final token = await _getToken();
    final res = await http.get(Uri.parse("$_baseUrl/api/student/classes"),
        headers: {'Authorization': 'Bearer $token'});

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['classes'];
      classes = (data as List).map((e) => ClassModel.fromJson(e)).toList();
      await _storage.write(
          key: 'classes',
          value: jsonEncode(classes.map((e) => e.toJson()).toList()));
    }
  }

  static Future<void> fetchResources() async {
    final token = await _getToken();
    final res = await http.get(Uri.parse("$_baseUrl/api/student/resources"),
        headers: {'Authorization': 'Bearer $token'});

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['resources'];
      resources = (data as List).map((e) => Resource.fromJson(e)).toList();
      await _storage.write(
          key: 'resources',
          value: jsonEncode(resources.map((e) => e.toJson()).toList()));
    }
  }

  static Future<void> fetchAttendance() async {
    final token = await _getToken();
    final res = await http.get(Uri.parse("$_baseUrl/api/student/attendance"),
        headers: {'Authorization': 'Bearer $token'});

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body)['attendance'];
      attendance = (data as List).map((e) => Attendance.fromJson(e)).toList();
      await _storage.write(
          key: 'attendance',
          value: jsonEncode(attendance.map((e) => e.toJson()).toList()));
    }
  }

  /// One-shot function to fetch all at once
  static Future<void> fetchAndStoreAllData() async {
    await Future.wait([
      fetchSubjects(),
      fetchAnnouncements(),
      fetchClasses(),
      fetchResources(),
      fetchAttendance(),
    ]);
  }


  static Future<void> loadFromStorage() async {
    subjects = await _loadListFromStorage<Subject>('subjects', Subject.fromJson);
    announcements = await _loadListFromStorage<Announcement>('announcements', Announcement.fromJson);
    classes = await _loadListFromStorage<ClassModel>('classes', ClassModel.fromJson);
    resources = await _loadListFromStorage<Resource>('resources', Resource.fromJson);
    attendance = await _loadListFromStorage<Attendance>('attendance', Attendance.fromJson);
  }

  static Future<List<T>> _loadListFromStorage<T>(
      String key, T Function(Map<String, dynamic>) fromJson) async {
    final data = await _storage.read(key: key);
    if (data == null) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => fromJson(e)).toList();
  }
}
