# ER Diagram

```mermaid
erDiagram
    %% Зв'язки (Relationships)
    USERS ||--|| BUYER : "is a"
    USERS ||--|| SELLER : "is a"
    BUYER ||--o{ ORDERS : places
    SELLER ||--o{ PRODUCT : sells
    CATEGORY ||--o{ PRODUCT : contains
    ORDERS ||--o{ ORDER_ITEM : contains
    PRODUCT ||--o{ ORDER_ITEM : "included in"

    %% Сутності (Entities)
    USERS {
        int id PK
        string email
        string password_hash
    }

    PRODUCT {
        int id PK
        string name
        decimal price
        int category_id FK
    }

    ORDERS {
        int id PK
        int buyer_id FK
        decimal total_amount
    }
