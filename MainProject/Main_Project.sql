CREATE DATABASE LIBRARY_DB;
use LIBRARY_DB;
CREATE TABLE Branch 
(
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(50),
    Contact_no BIGINT
);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, 'Aluva Ernakulam', 9873829332),
(2, 102, 'Kottarakara Kollam', 9283645281),
(3, 103, 'Calvathy Fort Kochi', 8790283765),
(4, 104, 'Changampuzha Kalamsery', 7689754323),
(5, 105, '10th padi kodungaloore', 7894512326);
SELECT * FROM Branch;

CREATE TABLE Employee
(
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(20),
    Emp_Position VARCHAR(20),
    Salary BIGINT,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Emp_Position, Salary, Branch_no)
VALUES
(201, 'Majeed Mammu', 'Manager', 60000, 1),
(202, 'Thaher Majeed', 'Assistant Manager', 50000, 2),
(203, 'Soman A', 'Sales Associate', 40000, 3),
(204, 'Anu Anthony', 'Clerk', 35000, 1),
(205, 'Uthara Chandran', 'Sales Associate', 40000, 4),
(206, 'Indu K R', 'Clerk', 35000, 2),
(207, 'Mettu Sara', 'Manager', 60000, 3),
(208, 'Sivapal', 'Assistant Manager', 50000, 4),
(209, 'Jishad Abdul', 'Clerk', 35000, 5),
(210, 'Jaziya M', 'Sales Associate', 40000, 5);

INSERT INTO Employee (Emp_Id, Emp_name, Emp_Position, Salary, Branch_no)
VALUES
(211, 'Bushara Abdul', 'Clerk', 35000, 5),
(212, 'Aman M', 'Sales Associate', 40000, 5),
(213, 'Nina Noufal', 'Clerk', 35000, 5),
(214, 'Shamina M', 'Sales Associate', 40000, 5);
SELECT * FROM Employee;

CREATE TABLE Customer
(
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(20),
    Customer_address VARCHAR(50),
    Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Will Smith', '123 First St', '2022-01-01'),
(2, 'Jane Johnson', '456 Second St', '2022-02-15'),
(3, 'Patrick Jane', '789 Third St', '2022-03-10'),
(4, 'Alice Wonder', '987 Fourth St', '2022-04-20'),
(5, 'Charlie Chapleen', '321 Fifth St', '2022-05-05');
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(6, 'Snow White', '987 sixth St', '2021-12-01'),
(7, 'Poppie Sailor', '321 Seventh St', '2021-05-05');
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(8, 'Barbie Girl', '321 Ninth St', '2022-05-05');
SELECT * FROM Customer;
CREATE TABLE Books
(
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(30),
    Rental_Price DECIMAL(10,5),
    Status VARCHAR(5), #[Give yes if book available and no if book not available] 
    Author VARCHAR(20),
    Publisher VARCHAR(50)
);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(101, 'The Great Gatsby', 'Fiction', 1299, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(102, 'To Kill a Mockingbird', 'Classics', 1599, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(103, 'The Hobbit', 'Fantasy', 1099, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
(104, '1984', 'Dystopian', 1499, 'no', 'George Orwell', 'Secker & Warburg'),
(105, 'Pride and Prejudice', 'Romance', 1199, 'yes', 'Jane Austen', 'T. Egerton, Whitehall'),
(106, 'The Catcher in the Rye', 'Fiction', 1199, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
(107, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1399, 'yes', 'J.K. Rowling', 'Scholastic'),
(108, 'The Da Vinci Code', 'Mystery', 1499, 'no', 'Dan Brown', 'Doubleday'),
(109, 'The Alchemist', 'Adventure', 1299, 'yes', 'Paulo Coelho', 'HarperCollins'),
(110, 'The Hunger Games', 'Science Fiction', 1599, 'yes', 'Suzanne Collins', 'Scholastic');
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(112, 'The Discovery of India', 'History', 24.99, 'yes', 'Jawaharlal Nehru', 'Oxford University Press'),
(113, 'India After Gandhi', 'History', 29.99, 'yes', 'Ramachandra Guha', 'HarperCollins');
SELECT * FROM Books;

CREATE TABLE IssueStatus
(
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,# Set as FOREIGN KEY and it refer customer_id in CUSTOMER table
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book INT, #Set as FOREIGN KEY and it should refer isbn in BOOKS tabl
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'The Great Gatsby', '2024-01-05', 101),
(2, 2, 'To Kill a Mockingbird', '2023-02-20', 102),
(3, 3, 'The Hobbit', '2023-03-15', 103),
(4, 4, '1984', '2023-04-25', 104),
(5, 5, 'Pride and Prejudice', '2023-05-10', 105),
(6, 1, 'The Catcher in the Rye', '2023-06-01', 106),
(7, 2, 'Harry Potter and the Sorcerer''s Stone', '2023-07-15', 107),
(8, 3, 'The Da Vinci Code', '2023-08-10', 108),
(9, 4, 'The Alchemist', '2023-09-20', 109),
(10, 5, 'The Hunger Games', '2024-10-05', 110);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(11, 4, 'The Hunger Games', '2021-12-01', 110),
(12, 2, 'Harry Potter and the Sorcerer''s Stone', '2021-10-15', 107);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(13, 2, 'The Da Vinci Code', '2023-05-10', 108);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(14, 2, 'The Alchemist', '2023-06-20', 109);
SELECT * FROM IssueStatus;

CREATE TABLE ReturnStatus
(
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 INT,#- Set as FOREIGN KEY and it should refer isbn in BOOKS table
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 2, 'To Kill a Mockingbird', '2023-03-10', 102),
(2, 3, 'The Hobbit', '2023-04-05', 103),
(3, 4, '1984', '2023-05-15', 104),
(4, 5, 'Pride and Prejudice', '2023-06-01', 105),
(5, 1, 'The Catcher in the Rye', '2023-07-15', 106),
(6, 2, 'Harry Potter and the Sorcerer''s Stone', '2023-08-10', 107),
(7, 3, 'The Da Vinci Code', '2023-09-20', 108),
(8, 4, 'The Alchemist', '2023-10-05', 109),
(9, 5, 'The Hunger Games', '2023-11-01', 110);


# 1. Retrieve the book title, category, and rental price of all available  books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE status='yes';

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT I.Issued_book_name,c.Customer_name FROM IssueStatus I INNER JOIN Customer c ON I.Issued_cust = c.Customer_Id;

# 4. Display the total count of books in each category.
SELECT Category AS Book_Category, COUNT(*) FROM Books GROUP BY Book_Category;

# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Emp_Position FROM Employee WHERE Salary > 50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name, Reg_date FROM Customer WHERE Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus) AND Reg_date < '2022-01-01';

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(Emp_name) AS Total_Employees FROM Employee GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.
SELECT Customer_name FROM Customer WHERE Customer_Id IN (SELECT Issued_cust FROM IssueStatus WHERE MONTH(Issue_date) = 6 AND year(Issue_date) =2023);

# 9. Retrieve book_title from book table containing history. 
SELECT Book_title FROM Books WHERE Category = "History";

# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(Emp_name) AS Total_Employee FROM Employee GROUP BY Branch_no HAVING Total_Employee>5;

