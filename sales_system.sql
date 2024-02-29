CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
INSERT INTO `clients` (
    `id`,
    `name`,
    `last_name`,
    `mobile`,
    `creation_date`
  )
VALUES (
    1,
    'John',
    'Doe',
    '123-456-7890',
    '2024-02-28 14:54:02'
  ),
  (
    2,
    'Jackie',
    'Johnson',
    '555-876-5598',
    '2024-02-28 14:54:02'
  ),
  (
    3,
    'Alicar',
    'John',
    '555-555-5598',
    '2024-02-28 14:54:02'
  ),
  (
    4,
    'John',
    'Wick',
    '000-000-0000',
    '2024-02-28 17:15:46'
  ),
  (
    5,
    'Ceristina',
    'Windman',
    '000-867-0000',
    '2024-02-28 17:17:49'
  );
CREATE TABLE `logging` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `operation` varchar(100) DEFAULT NULL,
  `log_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
INSERT INTO `logging` (`id`, `sale_id`, `operation`, `log_timestamp`)
VALUES (1, 1, 'Sale created', '2024-02-28 14:54:29'),
  (2, 2, 'Sale created', '2024-02-28 14:54:29'),
  (3, 3, 'Sale created', '2024-02-28 14:54:29'),
  (4, 7, 'Update', '2024-02-29 13:27:26'),
  (5, 8, 'Update', '2024-02-29 13:30:01'),
  (6, 9, 'Update', '2024-02-29 13:31:16');
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
INSERT INTO `products` (
    `id`,
    `name`,
    `description`,
    `category`,
    `creation_date`
  )
VALUES (
    1,
    'Product 1 updated',
    'Updated description of product 1',
    'Category 2',
    '2024-02-28 14:53:49'
  ),
  (
    2,
    'Product 2 updated',
    'Updated description of product 2',
    'Category 1',
    '2024-02-28 14:53:49'
  ),
  (
    3,
    'Product 3',
    'Description of Product 3',
    'Category 1',
    '2024-02-28 14:53:49'
  ),
  (
    4,
    'product 4',
    'product 4 description',
    'Category 2',
    '2024-02-28 16:19:51'
  ),
  (
    5,
    'Product 5 updated',
    'Updated description of product 5',
    'Category 2',
    '2024-02-28 16:25:19'
  ),
  (
    6,
    'product 6',
    'product 6 description',
    'Category 4',
    '2024-02-28 16:27:55'
  );
CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `total` decimal(10, 2) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
INSERT INTO `sales` (
    `id`,
    `creation_date`,
    `client_id`,
    `seller_id`,
    `total`
  )
VALUES (1, '2024-02-28 14:54:15', 1, 1, '2000.00'),
  (2, '2024-02-28 14:54:15', 2, 2, '600.00'),
  (3, '2024-02-28 14:54:15', 3, 1, '3333.00'),
  (4, '2024-02-28 21:14:25', 5, 2, '400.00'),
  (5, '2024-02-28 21:16:47', 5, 2, '400.00'),
  (6, '2024-02-29 14:21:19', 4, 1, '4000.00'),
  (7, '2024-02-29 14:27:26', 2, 2, '850.00'),
  (8, '2024-02-29 14:30:01', 5, 1, '6000.00'),
  (9, '2024-02-29 14:31:16', 3, 2, '333.00');
ALTER TABLE `clients`
ADD PRIMARY KEY (`id`);
ALTER TABLE `logging`
ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`);
ALTER TABLE `products`
ADD PRIMARY KEY (`id`);
ALTER TABLE `sales`
ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `creation_date` (`creation_date`);
ALTER TABLE `clients`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
ALTER TABLE `logging`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
ALTER TABLE `products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;
ALTER TABLE `sales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;
ALTER TABLE `logging`
ADD CONSTRAINT `logging_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`);
ALTER TABLE `sales`
ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);
COMMIT;