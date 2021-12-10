import 'dart:io';
import 'package:expense_manager/models/budget_model.dart';
import 'package:expense_manager/models/expense_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // if _database is null we instantiate it
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ExpenseManager.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Budgets ("
          "ID INTEGER PRIMARY KEY,"
          "Month_Name TEXT,"
          "Year INTEGER,"
          "Budget REAL"
          ")");

      await db.execute("CREATE TABLE Expenses ("
          "Month_ID INTEGER,"
          "Expense_Name TEXT,"
          "Amount REAL,"
          "Note TEXT,"
          "TimeStamp TEXT,"
          "Category TEXT,"
          ")");
    });
  }

  Future<void> insertBudget(BudgetModel budget) async {
    final db = await database;

    int rows =
        await db.rawInsert('INSERT INTO Budgets (Month_Name,Year,Budget) '
            'VALUES (${budget.monthName},${budget.year},${budget.budget})');
  }

  Future<void> insertExpense(ExpenseModel expense) async {
    final db = await database;

    db.rawInsert(
        'INSERT INTO Expenses (Month_ID,Expense_Name,Amount,Note,TimeStamp,Category) '
        'VALUES (${expense.monthId},${expense.expenseName},${expense.amount},${expense.note},${expense.timeStamp},${expense.category})');
  }
}
