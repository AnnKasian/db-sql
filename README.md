erDiagram

    users {
        int id PK
        string username
        string first_name
        string last_name
        string email
        string password
        int avatar_id FK
        datetime created_at
        datetime updated_at
    }

    files {
        int id PK
        string file_name
        string mime_type
        string key
        string url
        datetime created_at
        datetime updated_at
    }

    movie {
        int id PK
        string title
        text description
        decimal budget
        date release_date
        int duration
        int country_id FK
        int director_id FK
        int poster FK
        datetime created_at
        datetime updated_at
    }

    character {
        int id PK
        string name
        text description
        enum role
        int movie_id FK
        int actor_id FK
        datetime created_at
        datetime updated_at
    }

    person {
        int id PK
        string first_name
        string last_name
        text biography
        date date_of_birth
        enum gender
        int home_country_id FK
        int primary_photo_id FK
        datetime created_at
        datetime updated_at
    }

    country {
        int id PK
        string name
        datetime created_at
        datetime updated_at
    }

    genre {
        int id PK
        string name
        datetime created_at
        datetime updated_at
    }

    movie_genre {
        int movie_id PK, FK
        int genre_id PK, FK
        datetime created_at
        datetime updated_at
    }

    favorite_movies {
        int user_id PK, FK
        int movie_id PK, FK
        datetime created_at
        datetime updated_at
    }

    person_photos {
        int id PK
        int person_id FK
        int file_id FK
        datetime created_at
        datetime updated_at
    }

    users ||--|{ files : "has avatar"
    users ||--o{ favorite_movies : "has"
    files ||--o| movie : "is poster of"
    files ||--o| person : "is primary photo of"
    files ||--o{ person_photos : "is photo of"
    movie ||--|{ country : "is in"
    movie ||--o{ movie_genre : "has"
    movie ||--o{ character : "has"
    movie ||--o| person : "directed by"
    character ||--o| person : "played by"
    person ||--o| country : "home country"
    genre ||--o{ movie_genre : "in"
    favorite_movies ||--|| users : "belongs to"
    favorite_movies ||--|| movie : "favorite"
