CREATE TABLE IF NOT EXISTS users(
    user_id BIGINT AUTO INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    mobile_number VARCHAR(15) NOT NULL UNIQUE,
    description TINYTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL.
    created_by VARCHAR(50) NOT NULL,
    updated_at TIMESTAMP DEFAULT NULL,
    updated_by VARCHAR(50) DEFAULT NULL
)

CREATE TABLE IF NOT EXISTS libraryEntries(
    library_entry_user BIGINT AUTO INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    status VARCHAR(20) NOT NULL,
    pages_read INT DEFAULT 0 NOT NULL,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    finished_at TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by VARCHAR(50) NOT NULL,
    updated_by TIMESTAMP DEFAULT NULL,
    updated_by VARCHAR(50) DEFAULT NULL,
    CONSTRAINTS fk_library_entries_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINTS fk_library_entries_books FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINTS uc_library_entry_user_book UNIQUE (reading_list_id, user_id, book_id)
)

CREATE TABLE IF NOT EXISTS readingLists(
    reading_list_id BIGINT AUTO INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    name VARCHAR(50) NOT NULL,
    description TINYTEXT,
    isPublic BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by VARCHAR(50) NOT NULL,
    updated_by TIMESTAMP DEFAULT NULL,
    updated_by VARCHAR(50) DEFAULT NULL,
    CONSTRAINTS fk_reading_List_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINTS uc_reading_list_user UNIQUE (reading_list_id, user_id)
)

CREATE TABLE IF NOT EXISTS readingListItems(
    reading_list_item_id BIGINT AUTO INCREMENT PRIMARY KEY,
    reading_list_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    added_by VARCHAR(50) NOT NULL,
    CONSTRAINTS fk_reading_list_item_reading_list FOREIGN KEY (reading_list_id) REFERENCES readingLists(reading_list_id),
    CONSTRAINTS fk_reading_list_item_book FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINTS uk_reading_list_item_reading_list_book UNIQUE (reading_list_item_id, reading_list_id, book_id)
)



