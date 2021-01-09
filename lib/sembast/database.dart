import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


class AppDatabase {
    //Singleton instance
    static final AppDatabase _singleton = AppDatabase._();
    
    //Singleton accessor
    static AppDatabase get instance => _singleton;

    //Completer is used for transforming synchronous code into asynchronous code 
    Completer<Database> _dbOpenCompleter;

    //A privater constructor. Allows us to create instances of AppDatabase only from within the AppDatabase class itself.
    AppDatabase._();

    //Database object accessor
    Future<Database> get databse async {
        //If completer is null, AppDatabaseClasss is newly instantiated, so databse is not yet opened
        if(_dbOpenCompleter == null) {
            _dbOpenCompleter = Completer();
            //Calling _openDatabase will also complete the completer with database instance.
            _openDatabase();
        }
        return _dbOpenCompleter.future;
    }


    Future _openDatabase() async {
        //Get a platform-specific directory where persistent app data can be stored
        final appDocumentDir = await getApplicationDocumentsDirectory();
        
        //Path with the form: /platform-specific-directory/appDatabase.db
        final dbPath = join(appDocumentDir.path, 'appDatabase.db');
        
        final database = await databaseFactoryIo.openDatabase(dbPath);

        //Any code awaiting the Completer's future will now start executing
        _dbOpenCompleter.complete(database);


    }

}
