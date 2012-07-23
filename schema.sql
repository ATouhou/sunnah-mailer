-- vim: ts=4 sw=4 expandtab
create table collection (
    collection_id serial primary key
    , name text not null unique
    , english text not null
    , arabic text not null
);

create table book (
    book_id serial primary key
    , collection_id integer not null
    , english text not null
    , arabic text not null
    , unique ( collection_id, english, arabic )
    , foreign key (collection_id) references collection (collection_id) on update cascade on delete cascade
);

create table hadith (
    hadith_id serial primary key
    , collection_id integer not null
    , book_id integer
    , reference text
    , href text not null unique
    , text text
    , foreign key (collection_id) references collection (collection_id) on update cascade on delete cascade
    , foreign key (book_id) references book (book_id) on update cascade on delete cascade
);

create table complete (
    href text primary key
);
