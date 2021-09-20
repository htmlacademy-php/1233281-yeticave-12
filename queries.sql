INSERT INTO
        categories (name, slug)
VALUES
       ('Доски и лыжи', 'boards'),
       ('Крепления', 'attachment'),
       ('Ботинки', 'boots'),
       ('Одежда', 'clothing'),
       ('Инструменты', 'tools'),
       ('Разное', 'other');


INSERT INTO
        users (registration_date, email, name, password, contacts)
VALUES
       ('2021-09-20 10:00:00', '1user@email.ru', 'Alexandr', 'password1', 'contacts1'),
       ('2021-09-20 10:30:00', '2user@email.ru', 'Dmitry', 'password2', 'contacts2');


INSERT INTO
    lots (creation_date, name, description, image, start_price, expiration_date, bet_step, author_id, category_id)
VALUES
        ('2021-09-20 13:00:00', '2014 Rossignol District Snowboard', '2014 Rossignol District Snowboard',
        'img/lot-1.jpg', 10999, '2021-09-23', 100, 1, 1),
        ('2021-09-20 12:00:00', 'DC Ply Mens 2016/2017 Snowboard', 'DC Ply Mens 2016/2017 Snowboard',
         'img/lot-2.jpg', 159999, '2021-09-24', 100, 1, 1),
        ('2021-09-20 15:00:00','Крепления Union Contact Pro 2015 года размер L/XL', 'Крепления Union Contact Pro 2015 года размер L/XL',
         'img/lot-3.jpg', 8000, '2021-09-25', 100, 2, 2),
        ('2021-09-21 12:00:00', 'Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки для сноуборда DC Mutiny Charocal',
         'img/lot-4.jpg', 10999, '2021-09-26', 100, 2, 3),
        ('2021-09-21 14:00:00', 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка для сноуборда DC Mutiny Charocal',
         'img/lot-5.jpg', 7500, '2021-09-27', 100, 1, 4),
        ('2021-09-21 16:00:00', 'Маска Oakley Canopy', 'Маска Oakley Canopy',
         'img/lot-6.jpg', 5400, '2021-05-12', 100, 2, 6);

INSERT INTO
    bets (creation_date, price, author_id, lot_id)
VALUES
       ('2021-09-23 10:00:00', 6000, 1, 3),
       ('2021-09-23 15:00:00', 6500, 1, 3);


# 1) получить все категории;
SELECT name FROM categories;

# 2) получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, название категории;

# получаем таблицу лотов с именем лота, стартовой ценой, картинкой, ценой, именем категории (Цена является максимальным значением от след. выборки )
SELECT l.name, l.start_price, image, MAX(d.start_price), c.name category_name FROM lots l LEFT JOIN categories c on c.id = l.category_id

# получаем выборку всех лотов и различных ставок к ним (максимальная ставка будет ценой в первой выборке), где еще нет победителя
    JOIN (SELECT id, start_price FROM lots UNION SELECT lot_id, price FROM bets) d ON d.id = l.id WHERE l.winner_id IS NULL

# группируем по айди лота и дате создания и сортируем выборку по дате создания  
    GROUP BY l.id, l.creation_date ORDER BY l.creation_date DESC LIMIT 3;

# 3) показать лот по его ID. Получите также название категории, к которой принадлежит лот;
SELECT l.name, start_price, image, c.name category_name FROM lots l JOIN categories c ON c.id = l.category_id WHERE l.id = 2;

# 4) обновить название лота по его идентификатору;
UPDATE lots SET name = '2014 Rossignol District Snowboard' WHERE id = 1;

# 5) получить список ставок для лота по его идентификатору с сортировкой по дате.
SELECT * FROM bets WHERE lot_id = 6 ORDER BY creation_date DESC;