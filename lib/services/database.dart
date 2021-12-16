import 'dart:io';
import 'package:expense_manager/enums/global_enums.dart';
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
          "Category INTEGER"
          ")");
    });
  }

  Future<int> insertBudget(BudgetModel budget) async {
    final db = await database;

    int insertedRowID =
        await db.rawInsert("INSERT INTO Budgets (Month_Name,Year,Budget) "
            "VALUES ('${budget.monthName}',${budget.year},${budget.budget})");

    return insertedRowID;
  }

  Future<void> insertExpense(ExpenseModel expense) async {
    final db = await database;
    String query =
        "INSERT INTO Expenses (Month_ID,Expense_Name,Amount,Note,TimeStamp,Category) "
        "VALUES (${expense.monthId},'${expense.expenseName}',${expense.amount},'${expense.note}','${expense.timeStamp}',${expense.category!.index})";
    db.rawInsert(query);
  }

  Future<List<BudgetModel>> getAllBudgets() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Budgets');

    return List.generate(maps.length, (i) {
      return BudgetModel(
          id: maps[i]['ID'],
          monthName: maps[i]['Month_Name'],
          year: maps[i]['Year'].toString(),
          budget: maps[i]['Budget']);
    });
  }

  Future<List<ExpenseModel>> getExpensesFromMonthId(int id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query('Expenses', where: 'Month_ID = ?', whereArgs: [id]);

    return List.generate(maps.length, (i) {
      return ExpenseModel(
          monthId: maps[i]['Month_ID'],
          expenseName: maps[i]['Expense_Name'],
          amount: maps[i]['Amount'],
          note: maps[i]['Note'],
          timeStamp: maps[i]['TimeStamp'],
          category: ExpenseCategory.values[int.parse(maps[i]['Category'])]);
    });
  }

  Future<double> getTotalExpensesOfMonth(int monthId) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT SUM(Amount) as TotalExpense FROM Expenses WHERE Month_ID = $monthId');

    return double.parse(maps[0]['TotalExpense']);
  }

  Future<int> getLastInsertedID() async {
    final db = await database;

    var id = await db.rawQuery('SELECT last_insert_rowid();');

    return 0;

    // final String MY_QUERY = "SELECT last_insert_rowid()";
    //     Cursor cur = mDb.rawQuery(MY_QUERY, null);
    //     cur.moveToFirst();
    //     int ID = cur.getInt(0);
    //     cur.close();
    //     return ID;
  }
}
