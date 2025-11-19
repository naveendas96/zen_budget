# ZenBudget Architecture Document

ZenBudget is a privacy focused, offline first finance tracker built with Flutter. It uses a clean modular architecture, a fast local database, encrypted cloud sync, SMS ingestion, and a local AI insights engine. The goal is to create a reliable, scalable, and secure personal finance platform.

==================================================
1. ARCHITECTURE GOALS
==================================================

1. Privacy first. All processing happens locally.
2. Offline first. User can use the full app without internet.
3. Modular structure. Each feature is isolated.
4. High performance. Avoid unnecessary rebuilds and heavy operations.
5. Predictable state management.
6. Clear separation of UI, logic, and data.
7. Secure encrypted sync and storage.

==================================================
2. TECHNOLOGY STACK
==================================================

Frontend:
- Flutter
- Material 3
- Riverpod or Bloc for state management

Data Layer:
- Local database (Isar or Drift)
- Settings storage (SharedPreferences or Hive)
- Encrypted file based JSON export
- Google Drive REST API

System Integrations:
- SMS Receiver (Android only)
- Biometrics
- AES 256 encryption

AI Layer:
- On device rule based NLP
- Spending analysis engine
- Simple predictive models
- Insight card generation

==================================================
3. LAYERED ARCHITECTURE
==================================================

ZenBudget is structured into 3 clear layers.

Presentation Layer:
- Screens
- Widgets
- Themes
- Navigation

Domain Layer:
- Business logic
- Use cases
- Models
- Rules engine

Data Layer:
- Database
- SMS parser
- Repositories
- Sync engine
- Storage providers

==================================================
4. FOLDER STRUCTURE
==================================================

lib/
  core/         (models, constants, helpers)
  data/         (database, sms parser, sync, repositories)
  features/     (dashboard, transactions, budgets, subscriptions, sms)
  ui/           (screens, widgets, theme)
  sync/         (backup, restore, conflict resolution)
  utils/        (extensions, formatters, mappers)

==================================================
5. DATABASE ARCHITECTURE
==================================================

Database choice: Isar (fast) or Drift (SQL flexibility).

---------------  
Entity: Transaction  
---------------
id  
amount  
type (expense, income, transfer)  
accountId  
categoryId  
payeeId  
date  
note  
tags  
smsReference  
isPending  
createdAt  
updatedAt  

---------------  
Entity: Category  
---------------
id  
name  
icon  
color  
parentCategoryId  

---------------  
Entity: Account  
---------------
id  
name  
type (bank, wallet, cash, credit)  
openingBalance  
color  

---------------  
Entity: Budget  
---------------
id  
categoryId  
amount  
period (monthly or weekly)  

---------------  
Entity: Subscription  
---------------
id  
name  
amount  
interval  
lastPaid  
nextDue  

---------------  
Entity: Rule  
---------------
id  
conditions (keywords, senders, patterns)  
actions (assign category, auto confirm)  

---------------  
Entity: Settings  
---------------
theme  
privacyMode  
biometricsEnabled  
syncEnabled  

==================================================
6. SMS INGESTION PIPELINE
==================================================

Step 1: Android system delivers incoming SMS.  
Step 2: Parser reads message body and sender.  
Step 3: Regex patterns extract:
- amount debited or credited
- balance
- payee or merchant
- card or account used

Step 4: Rule engine checks:
- known senders
- previous SMS patterns
- category mappings

Step 5: If low confidence:
- Add to Pending Queue

Step 6: If high confidence and rule allows:
- Auto confirm transaction

Step 7: Reference SMS saved for traceability.

Privacy Notes:
- SMS content stays local.
- Never uploaded to server.
- User can disable SMS processing anytime.

==================================================
7. SYNC ARCHITECTURE
==================================================

Backup Flow:
1. Export all data as JSON.
2. Encrypt file using AES 256.
3. Upload to Google Drive appDataFolder.

Restore Flow:
1. Download encrypted backup.
2. Decrypt locally.
3. Validate snapshot.
4. Apply restore or merge.

Conflict Resolution:
- Use last write wins.
- Each entity has timestamps.
- Future option for merge mode.

==================================================
8. AI INSIGHTS ENGINE
==================================================

Components:

1. Intent Detector  
   Keyword based interpretation:
   - "spend"
   - "month"
   - "food"
   - "compare"
   - "trend"
   - "prediction"

2. Analytics Engine  
   - Category totals  
   - Weekly spending  
   - Monthly summaries  
   - Subscription forecast  
   - Trend comparisons  

3. Prediction Engine  
   - Rolling averages  
   - Simple local regression  

4. Insight Card Generator  
   Produces cards:
   - Spending summary  
   - Category insights  
   - Trend graph  
   - Overspend alert  
   - Savings opportunity  

All AI processing happens locally.

==================================================
9. SECURITY ARCHITECTURE
==================================================

Data Security:
- Full local database encryption
- Encrypted sync file
- Sensitive fields masked

App Security:
- Biometric lock
- PIN lock
- Hide balance mode

User Privacy:
- No server storage
- No analytics tracking
- No bank login
- No external APIs needed for SMS parsing

==================================================
10. SCALABILITY AND FUTURE GROWTH
==================================================

The architecture supports future additions:
- Mutual funds
- Investments
- Net worth tracking
- Multi profile support
- Tax reports
- Bank sync (optional)
- Plugin modules
- Collaborative budgeting

The modular design ensures no major rewrites for new modules.

