# Лабораторна робота №6: Робота з ORM Prisma

## Мета роботи
Налаштувати ORM Prisma для роботи з існуючою базою даних PostgreSQL, виконати міграції схеми даних та перевірити роботу через JS-скрипт.

## Виконані кроки

### 1. Налаштування середовища
- Ініціалізовано проект Node.js.
- Встановлено **Prisma v5.22.0** (вибрано як стабільну версію для уникнення конфліктів з driver adapters у новій v7).
- Налаштовано підключення до БД через файл `.env` та `schema.prisma`.

### 2. Міграції бази даних (Schema Evolution)
Було внесено зміни у файл `schema.prisma` та застосовано їх до бази:
1.  **Створено нову сутність `Ticket`**:
    - Для системи підтримки користувачів.
    - Поля: `id`, `title`, `message`, `createdAt`.
2.  **Модифіковано сутність `Product`**:
    - Додано поле `inStock` (Boolean, default: true).
    - Видалено поле `description` (оптимізація структури).

Команди міграцій:
```bash
npx prisma migrate dev --name init_schema
npx prisma migrate dev --name add_ticket_and_update_product