# Spendly 💸 - Smart Personal Expense & Budget Tracker

Spendly is a modern, cross-platform personal finance management application built with **Flutter** and integrated with **Firebase Authentication**. It helps users track daily spending, set monthly budgets, and visualize financial habits with smart AI-driven analytics.

---

## 🌟 Overview & Current Status

* **Firebase Authentication:** Fully implemented and functional user authentication pipeline (Email/Password Sign-Up, Login, and Session Handling via Firebase Auth).
* **Modern UI/UX Architecture:** Clean, responsive, and component-based UI design implemented across all core views, featuring custom painters and smooth user flows.
* **Seamless Internal Navigation:** Comprehensive screen routing connecting dashboards, transaction management, budgeting modules, AI insights, and profile management.

---

## 📱 App Architecture & Screens

### 1. Authentication Flow
* **Login Screen:** Clean login interface with validation and instant session persistence.
* **Sign Up Screen:** Account creation integrated directly with Firebase.

### 2. Main Dashboard & Navigation (`MainNavigationScreen`)
* **Custom Floating Bottom Navigation Bar:** Quick navigation across core tabs with an elevated, quick-access **Add Expense (+)** center action button.
* **Home Screen:** Total balance overview, monthly spending cards with custom wave visuals, category breakdowns, and a recent activity feed.
* **Expenses Screen:** Complete transaction log, daily grouping (Today / Yesterday), quick search, and filter options.
* **Analytics Screen:** Visual spending analytics, weekly Spending Flow bar charts, daily averages, and category progression bars.
* **Profile Screen:** User profile overview, tier status, personal settings, preferences (theme, currency, notifications), and sign-out controls.

### 3. Feature Modules & Deep Links
* **Add Expense (`AddExpenseScreen`):** Quick-entry screen for amount, category, date, and payment method selection.
* **Edit Expense (`EditExpenseScreen`):** Transaction modification interface with note additions and delete options.
* **Budgets (`BudgetsScreen` & `CreateBudgetScreen`):** Track category limits, visualize consumption progress, and set new monthly budget thresholds.
* **AI Insights & Chat (`AiInsightsScreen` & `AiChatScreen`):** AI spending summaries, key findings alerts (budget limits, weekend spending patterns), and an interactive AI financial assistant chat.

---

## 🛠️ Project Structure

```text
lib/
├── AddExpense/              # Expense addition view
├── AI/                      # AI Insights and AI Chat views
├── Analytics/               # Financial analytics and reporting views
├── Budgets/                 # Budget listing view
├── CreateBudget/            # Create budget form view
├── EditExpense/             # Expense editing view
├── Expenses/                # All transactions list view
├── Home/                    # Main dashboard view
├── Login/                   # User login view
├── Navigation/              # Main navigation scaffold & bottom bar setup
├── Profile/                 # User profile & preferences view
├── SignUp/                  # User registration view
├── Widget/                  # Reusable components & custom painters
│   ├── AddExpenseWidgets.dart
│   ├── AiChatWidgets.dart
│   ├── AiInsightsWidgets.dart
│   ├── AnalyticsWidgets.dart
│   ├── BudgetItem.dart
│   ├── CreateBudgetWidgets.dart
│   ├── CustomBottomNavBar.dart
│   ├── EditExpenseWidgets.dart
│   ├── ExpenseItem.dart
│   ├── HomeItem.dart
│   └── ProfileWidgets.dart
├── firebase_options.dart    # Firebase CLI generated configuration
└── main.dart                # App entry point

🔮 Upcoming Roadmap
[ ] Connect Cloud Firestore for real-time transaction and budget synchronization (CRUD).

[ ] Integrate Gemini API for live, context-aware AI financial analysis and chat responses.

[ ] Add state management (Cubit / Bloc) across all data pipelines.