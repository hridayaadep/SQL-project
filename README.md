# E-Commerce Order Trends Database Project

## Project Overview

This project is a MySQL-based E-Commerce Database Management System designed to manage customers, products, orders, coupons, reviews, shipments, and shopping carts. The database provides a structured way to store and analyze e-commerce order trends and customer purchasing behavior.

---

## Database Name

```sql
e_commerce_order_trends
```

---

## Objectives

* Store and manage customer information.
* Track products and inventory.
* Manage customer orders and order details.
* Handle discount coupons and promotions.
* Record product reviews and ratings.
* Monitor shipment and delivery status.
* Manage shopping cart functionality.
* Analyze order trends and business performance.

---

## Technologies Used

* MySQL
* SQL (DDL & DML)
* Relational Database Management System (RDBMS)

---

## Database Tables

### 1. Users

Stores user login and role information.

**Attributes:**

* UserID
* Name
* Email
* PasswordHash
* Role
* CreatedAt

---

### 2. Customers

Stores customer information.

**Attributes:**

* CustomerID
* Name
* Email
* Phone
* Address
* CreatedAt

---

### 3. Products

Stores product details and inventory information.

**Attributes:**

* ProductID
* ProductName
* Category
* Price
* Stock
* Description
* ImageURL
* CreatedAt

---

### 4. Orders

Stores customer order information.

**Attributes:**

* OrderID
* CustomerID
* OrderDate
* TotalAmount
* Status

---

### 5. OrderDetails

Stores product-level information for each order.

**Attributes:**

* OrderDetailID
* OrderID
* ProductID
* Quantity
* Price

---

### 6. Coupons

Stores discount coupon information.

**Attributes:**

* CouponID
* Code
* DiscountPercentage
* ExpiryDate
* UsageLimit
* CreatedAt

---

### 7. OrderCoupons

Links coupons with orders.

**Attributes:**

* OrderCouponID
* OrderID
* CouponID
* DiscountAmount

---

### 8. ProductReviews

Stores customer reviews and ratings.

**Attributes:**

* ReviewID
* ProductID
* CustomerID
* Rating
* ReviewText
* ReviewDate

---

### 9. Shipments

Stores shipment and delivery information.

**Attributes:**

* ShipmentID
* OrderID
* Carrier
* TrackingNumber
* ShippedDate
* EstimatedDeliveryDate
* DeliveredDate
* Status

---

### 10. Cart

Stores shopping cart information.

**Attributes:**

* CartID
* CustomerID
* ProductID
* Quantity
* AddedDate

---

## Key Features

* Customer Management
* Product Inventory Tracking
* Order Processing
* Coupon and Discount Management
* Product Review System
* Shipment Tracking
* Shopping Cart Management
* Sales and Order Trend Analysis

---

## Relationships

* One Customer can place multiple Orders.
* One Order can contain multiple Products.
* Products can appear in multiple Orders.
* Customers can submit Reviews for Products.
* Orders can use Coupons.
* Orders can have Shipment details.

---

## Learning Outcomes

Through this project, I learned:

* Database Design
* Entity Relationship Modeling
* SQL Queries
* Table Relationships
* Primary and Foreign Keys
* Data Insertion and Management
* Business Data Analysis
* E-Commerce Database Architecture

---

## Author

Hridaya Adep

Data Analytics & AI Enthusiast
