// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ArticleDao? _articleDaoInstance;

  SourceDao? _sourceDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `articles_table` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `sources_table` (`source_id` INTEGER PRIMARY KEY AUTOINCREMENT, `id` TEXT, `name` TEXT, `article_id` INTEGER, FOREIGN KEY (`article_id`) REFERENCES `articles_table` (`id`) ON UPDATE CASCADE ON DELETE CASCADE)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ArticleDao get articleDao {
    return _articleDaoInstance ??= _$ArticleDao(database, changeListener);
  }

  @override
  SourceDao get sourceDao {
    return _sourceDaoInstance ??= _$SourceDao(database, changeListener);
  }
}

class _$ArticleDao extends ArticleDao {
  _$ArticleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _dBArticleInsertionAdapter = InsertionAdapter(
            database,
            'articles_table',
            (DBArticle item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                }),
        _dBArticleDeletionAdapter = DeletionAdapter(
            database,
            'articles_table',
            ['id'],
            (DBArticle item) => <String, Object?>{
                  'id': item.id,
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DBArticle> _dBArticleInsertionAdapter;

  final DeletionAdapter<DBArticle> _dBArticleDeletionAdapter;

  @override
  Future<List<DBArticle>> getAllArticles() async {
    return _queryAdapter.queryList('SELECT * FROM articles_table',
        mapper: (Map<String, Object?> row) => DBArticle(
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?,
            id: row['id'] as int?));
  }

  @override
  Future<void> deleteAllArticles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM articles_table');
  }

  @override
  Future<int> insertArticle(DBArticle article) {
    return _dBArticleInsertionAdapter.insertAndReturnId(
        article, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertArticleVoid(DBArticle article) async {
    await _dBArticleInsertionAdapter.insert(
        article, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteArticle(DBArticle article) {
    return _dBArticleDeletionAdapter.deleteAndReturnChangedRows(article);
  }

  @override
  Future<List<int>> insertArticles(
    List<Article> articles,
    AppDatabase appDatabase,
  ) async {
    if (database is sqflite.Transaction) {
      return super.insertArticles(articles, appDatabase);
    } else {
      return (database as sqflite.Database)
          .transaction<List<int>>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.articleDao
            .insertArticles(articles, appDatabase);
      });
    }
  }
}

class _$SourceDao extends SourceDao {
  _$SourceDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _sourceInsertionAdapter = InsertionAdapter(
            database,
            'sources_table',
            (Source item) => <String, Object?>{
                  'source_id': item.sourceId,
                  'id': item.id,
                  'name': item.name,
                  'article_id': item.articleId
                }),
        _sourceDeletionAdapter = DeletionAdapter(
            database,
            'sources_table',
            ['source_id'],
            (Source item) => <String, Object?>{
                  'source_id': item.sourceId,
                  'id': item.id,
                  'name': item.name,
                  'article_id': item.articleId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Source> _sourceInsertionAdapter;

  final DeletionAdapter<Source> _sourceDeletionAdapter;

  @override
  Future<List<Source>> getAllSources() async {
    return _queryAdapter.queryList('SELECT * FROM sources_table',
        mapper: (Map<String, Object?> row) => Source(
            sourceId: row['source_id'] as int?,
            id: row['id'] as String?,
            name: row['name'] as String?,
            articleId: row['article_id'] as int?));
  }

  @override
  Future<void> deleteAllArticles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM sources_table');
  }

  @override
  Future<void> insertSource(Source source) async {
    await _sourceInsertionAdapter.insert(source, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSource(Source source) async {
    await _sourceDeletionAdapter.delete(source);
  }
}
