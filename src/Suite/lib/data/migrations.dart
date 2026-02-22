class Migrations {
  static Map<int, String> migrationScripts = {
    1: '''create table Room
(
    id     TEXT not null,
    userId TEXT not null,
    name   TEXT not null,
    constraint Room_pk
        primary key (id, userId)
);''',
    2: '''create table Task
(
    id          TEXT    not null,
    userId      TEXT    not null,
    name        TEXT    not null,
    interval    integer not null,
    intervalTyp integer not null,
    duration    integer not null,
    roomId      TEXT    not null,
    roomUserId  TEXT    not null,
    constraint Task_pk
        primary key (id, userId),
    constraint Task_Room_id_userId_fk
        foreign key (roomId, roomUserId) references Room
);''',
    3: '''create table CompletedTask
(
    taskId     TEXT not null,
    taskUserId TEXT not null,
    userId     TEXT not null,
    done       TEXT not null,
    constraint CompletedTask_pk
        primary key (taskId, taskUserId, done),
    constraint CompletedTask_Task_id_userId_fk
        foreign key (taskId, taskUserId) references Task
);
    ''',
    4: '''create table Category
(
    id     TEXT not null,
    userId TEXT not null,
    name   TEXT not null,
    color  TEXT not null,
    constraint Category_pk
        primary key (id, userId)
);
    ''',
    5: '''create table ShoppingItem
(
    id             TEXT not null,
    userId         TEXT not null,
    name           TEXT not null,
    categoryId     TEXT not null,
    categoryUserId TEXT not null,
    constraint ShoppingItem_pk
        primary key (id, userId),
    constraint ShoppingItem_Category_id_userId_fk
        foreign key (categoryId, categoryUserId) references Category
);
    ''',
    6: '''create table ShoppingList
(
    id     TEXT not null,
    userId TEXT not null,
    name   TEXT not null,
    constraint ShoppingList_pk
        primary key (id, userId)
);
    ''',
    7: '''create table ShoppingListItem
(
    shoppingListId TEXT    not null,
    shoppingItemId TEXT    not null,
    count          integer not null,
    note           TEXT,
    bought         integer not null,
    constraint ShoppingListItem_pk
        primary key (shoppingListId, shoppingItemId)
);
  ''',
    8: '''CREATE VIEW ShoppingListItemView as
select sli.*, si.name, c.name as category, c.color as categoryColor from ShoppingListItem sli
left join ShoppingItem si on sli.shoppingItemId = si.id
left join Category c on si.categoryId = c.id and si.categoryUserId = c.userId;
''',
  };
}
