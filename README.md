### 1. What is PostgreSQL?

PostgreSQL হল একটি ওপেন-সোর্স, অবজেক্ট-রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (ORDBMS), যা ডাটা সংরক্ষণ, পরিচালনা ও প্রসেস করার জন্য ব্যবহৃত হয়। এটি ACID (Atomicity, Consistency, Isolation, Durability) কমপ্লায়েন্স মেনে চলে এবং SQL সমর্থন করে।

### 2. What is the purpose of a database schema in PostgreSQL?

একটি ডাটাবেস স্কিমা হল ডাটাবেসের কাঠামোর একটি যৌক্তিক উপস্থাপনা যা টেবিল, ভিউ, ইনডেক্স, স্টোরড প্রসিডিউর ইত্যাদির সংজ্ঞা দেয়। PostgreSQL-এ, স্কিমা মূলত একটি নির্দিষ্ট ব্যবহারকারীর অধীনে ডাটাবেস অবজেক্টগুলোকে আলাদা রাখতে সাহায্য করে এবং একই ডাটাবেসের মধ্যে মাল্টিপল স্কিমা তৈরি করা সম্ভব।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

- **Primary Key:** এটি একটি টেবিলের ইউনিক আইডেন্টিফায়ার যা প্রতিটি রেকর্ডকে অনন্যভাবে চিহ্নিত করে। এটি ডুপ্লিকেট বা `NULL` হতে পারে না।
- **Foreign Key:** এটি অন্য একটি টেবিলের Primary Key-এর সাথে সংযুক্ত থাকে এবং দুটি টেবিলের মধ্যে সম্পর্ক স্থাপন করতে ব্যবহৃত হয়। এটি রেফারেন্সিং টেবিলে ডাটা ইন্টিগ্রিটি নিশ্চিত করে।

### 4. What is the difference between the `VARCHAR` and `CHAR` data types?

PostgreSQL-এ VARCHAR হল পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং, যেখানে শুধু প্রয়োজনীয় জায়গা দখল হয়। অন্যদিকে, CHAR নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে এবং ছোট ইনপুট হলে বাকি জায়গা স্বয়ংক্রিয়ভাবে স্পেস দিয়ে পূরণ করা হয়। VARCHAR মেমোরি ব্যবহারে কার্যকর, যেখানে CHAR নির্দিষ্ট দৈর্ঘ্যের ডাটা সংরক্ষণে উপযুক্ত এবং দ্রুততর অনুসন্ধান সক্ষম করে।

### 5. Explain the purpose of the `WHERE` clause in a `SELECT` statement.

`WHERE` ক্লজ ব্যবহৃত হয় নির্দিষ্ট শর্ত অনুযায়ী ডাটা ফিল্টার করার জন্য।

### 6. What are the `LIMIT` and `OFFSET` clauses used for?

- **LIMIT:** নির্দিষ্ট সংখ্যক রেকর্ড ফেরত দেয়।
- **OFFSET:** নির্দিষ্ট সংখ্যক রেকর্ড স্কিপ করে এরপর থেকে রেকর্ড ফেরত দেয়।

### 7. How can you modify data using `UPDATE` statements?

`UPDATE` স্টেটমেন্ট নির্দিষ্ট টেবিলে থাকা ডাটা পরিবর্তনের জন্য ব্যবহৃত হয়।

````UPDATE students
SET name = 'Rahim'
WHERE id = 3;

এটি `id = 3` এর `name` আপডেট করবে।


### 8. What is the significance of the `JOIN` operation, and how does it work in PostgreSQL?

JOIN অপারেশন PostgreSQL-এ একাধিক টেবিলের ডাটা একসঙ্গে আনতে ব্যবহার করা হয়। এটি তখনই দরকার হয় যখন টেবিলগুলোর মধ্যে সম্পর্ক থাকে এবং আমাদের একাধিক টেবিল থেকে তথ্য প্রয়োজন হয়।

JOIN অপারেশন বিভিন্ন ধরনের হতে পারে:

- **INNER JOIN:** দুটি টেবিলের মিল থাকা রেকর্ডগুলো দেখায়।
- **LEFT JOIN:** প্রথম টেবিলের সব ডাটা এবং দ্বিতীয় টেবিলের মিল থাকা ডাটা দেখায়।
- **RIGHT JOIN:** দ্বিতীয় টেবিলের সব ডাটা এবং প্রথম টেবিলের মিল থাকা ডাটা দেখায়।
- **FULL JOIN:** উভয় টেবিলের সব ডাটা দেখায়, মিল থাকুক বা না থাকুক।

### 9. Explain the `GROUP BY` clause and its role in aggregation operations.

`GROUP BY` ক্লজ ব্যবহার করা হয় ডাটা গ্রুপ করতে এবং অ্যাগ্রিগেট ফাংশনের সাথে ব্যবহার করা হয়।

```SELECT student_id, COUNT(*)
FROM courses
GROUP BY student_id;```

এটি প্রতিটি `student_id` কতগুলো কোর্স নিয়েছে তা গণনা করবে।

### 10. How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in PostgreSQL?

PostgreSQL-এ COUNT(), SUM(), এবং AVG() হল অ্যাগ্রিগেট ফাংশন, যা ডাটার উপর গণনা করে নির্দিষ্ট ফলাফল প্রদান করে। এগুলো সাধারণত GROUP BY বা HAVING ক্লজের সাথে ব্যবহার করা হয়, তবে আলাদাভাবেও কাজ করে।

#### 1. COUNT() ফাংশন

COUNT() ফাংশন কোনো নির্দিষ্ট কলামে থাকা রেকর্ড বা সারির সংখ্যা গণনা করতে ব্যবহার করা হয়। এটি সাধারণত ডাটাবেজে কতটি ডাটা আছে তা জানতে সাহায্য করে।

```SELECT department, COUNT(id) AS total_employees
FROM employees
GROUP BY department;```

এটি প্রতিটি department অনুযায়ী কর্মচারীর সংখ্যা দেখাবে।

#### 2. SUM() ফাংশন

SUM() ফাংশন নির্দিষ্ট কলামের সংখ্যাসূচক ডাটার মোট যোগফল নির্ধারণ করতে ব্যবহৃত হয়। এটি সাধারণত বিক্রয়, বেতন বা অন্যান্য পরিমাণগত তথ্যের যোগফল গণনার জন্য ব্যবহার করা হয়।

```SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;```

এটি প্রতিটি department অনুযায়ী মোট বেতন দেখাবে।

#### 3. AVG() ফাংশন

AVG() ফাংশন নির্দিষ্ট কলামের গড় মান গণনা করতে ব্যবহৃত হয়। এটি সাধারণত গড় বেতন, গড় বিক্রয় বা অন্য কোনো গড় পরিমাণ বের করতে সাহায্য করে।

```SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;```

এটি প্রতিটি department অনুযায়ী গড় বেতন দেখাবে।
````
