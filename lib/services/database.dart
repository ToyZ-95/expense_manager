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

    await createTables();

    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ExpenseManager.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) {},
    );
  }

  Future<void> createTables() async {
    final db = await database;
    await db.execute("CREATE TABLE IF NOT EXISTS Budgets ("
        "MonthId INTEGER PRIMARY KEY,"
        "MonthName TEXT,"
        "Year INTEGER,"
        "Budget REAL"
        ")");

    await db.execute("CREATE TABLE IF NOT EXISTS Expenses ("
        "ExpenseId INTEGER PRIMARY KEY,"
        "MonthId INTEGER,"
        "ExpenseName TEXT,"
        "Amount REAL,"
        "Note TEXT,"
        "TimeStamp TEXT,"
        "Category INTEGER"
        ")");
  }

  Future<int> insertBudget(BudgetModel budget) async {
    final db = await database;

    return await db.rawInsert("INSERT INTO Budgets (MonthName,Year,Budget) "
        "VALUES ('${budget.monthName}',${budget.year},${budget.budget})");
  }

  Future<int> insertExpense(ExpenseModel expense) async {
    final db = await database;
    String query =
        "INSERT INTO Expenses (MonthId,ExpenseName,Amount,Note,TimeStamp,Category) "
        "VALUES (${expense.monthId},'${expense.expenseName}',${expense.amount},'${expense.note}','${expense.timeStamp}',${expense.category!.index})";
    return await db.rawInsert(query);
  }

  Future<List<BudgetModel>> getAllBudgets() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Budgets');

    return List.generate(maps.length, (i) {
      return BudgetModel(
          id: maps[i]['MonthId'],
          monthName: maps[i]['MonthName'],
          year: maps[i]['Year'].toString(),
          budget: maps[i]['Budget']);
    });
  }

  Future<List<ExpenseModel>> getExpensesFromMonthId(int id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query('Expenses', where: 'MonthId = ?', whereArgs: [id]);

    return List.generate(maps.length, (i) {
      return ExpenseModel(
          monthId: maps[i]['MonthId'],
          expenseId: maps[i]['ExpenseId'],
          expenseName: maps[i]['ExpenseName'],
          amount: maps[i]['Amount'],
          note: maps[i]['Note'],
          timeStamp: maps[i]['TimeStamp'],
          category: ExpenseCategory
              .values[int.parse(maps[i]['Category'].toString())]);
    });
  }

  Future<double> getTotalExpensesOfMonth(int monthId) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        'SELECT SUM(Amount) as TotalExpense FROM Expenses WHERE MonthId = $monthId');

    return double.parse(maps[0]['TotalExpense']);
  }

  Future<void> deleteExpense(ExpenseModel expenseModel, {wholeDay}) async {
    final db = await database;

    String query = '';

    if (!wholeDay) {
      query =
          "DELETE FROM Expenses WHERE MonthId = ${expenseModel.monthId} AND ExpenseId = ${expenseModel.expenseId}";
    } else {
      query =
          "DELETE FROM Expenses WHERE MonthId = ${expenseModel.monthId} AND TimeStamp = '${expenseModel.timeStamp}'";
    }

    db.rawQuery(query);
    // db.delete("Expenses",
    //     where: "MonthId = ? AND ExpenseId = ?",
    //     whereArgs: [expenseModel.monthId, expenseModel.expenseId]);
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
