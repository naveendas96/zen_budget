# ZenBudget — Product Requirements Document (PRD)

## 1. Executive Summary
ZenBudget is a privacy-first, customizable, SMS-aware personal finance tracker for India with global-scale capability. It emphasizes calm, clarity, automation, and user data ownership.

ZenBudget’s core strengths:
- Highly customizable categories and dashboards  
- Offline-first with encrypted Google Drive sync  
- Smart SMS parsing with user confirmation  
- AI-powered insights  
- Zen-inspired Material You UI  

---

## 2. Problem Statement
Most Indian finance apps have these issues:
- Require bank logins  
- Sell or leak data  
- Lack deep customization  
- Have cluttered UI  
- Provide unreliable SMS parsing  

ZenBudget solves these by being:
- 100% private (local DB + encrypted sync)  
- Customizable at every level  
- Calming and intuitive  
- AI-enhanced for insights  

---

## 3. Vision & Philosophy
- Calm, mindful UI  
- No forced automation  
- Zero cloud dependency  
- You own your financial data  
- Intelligent learning & suggestions  
- Simple over clever  

---

## 4. Target Audience
- Indian users tracking expenses manually  
- Privacy-conscious users  
- Non-technical individuals needing clarity  
- Budget-conscious professionals  
- Multi-device users  

---

## 5. Success Metrics
- Daily expense logs  
- Budget adherence improvement  
- % auto-categorization via SMS  
- Sync reliability  
- AI engagement rate  

---

## 6. Core Features

### 6.1 Dashboard
- Total balance  
- Budget summary  
- Insights carousel  
- Recent transactions  
- Upcoming subscriptions  
- Quick-add actions  

### 6.2 Transactions
- Universal transaction feed  
- Filters: date, category, account, tags  
- Delete/Edit  
- Pull to refresh  
- Infinite scroll  

### 6.3 Add Transaction
- Expense, Income, Transfer  
- Category grid  
- Payee detection  
- Tags + notes  

### 6.4 SMS Pending Queue
- Auto-detected from SMS  
- Inbox-style confirmation  
- Bulk Confirm/Delete  
- Rule suggestions  
- Low-confidence warnings  

### 6.5 Budgets
- Monthly category budgets  
- Learning Mode (first 60 days)  
- What-if sliders  
- Discipline levels (Strict/Balanced/Easy)  
- Overspend nudges  

### 6.6 Subscriptions
- Auto-detected recurring payments  
- Reminders  
- History view  
- Pause/Delete  

### 6.7 AI Assistant
- Natural queries (“How much did I spend last week?”)  
- Category breakdowns  
- Predictions  
- Transaction search via NLP  
- Nudges  

### 6.8 Sync
- Encrypted Google Drive Sync  
- Multi-device support  
- Manual + auto backups  
- Restore and recovery  

### 6.9 Settings  
- Accounts  
- Categories  
- Tags  
- Rules  
- Themes  
- Privacy  
- Security  
- AI preferences  

---

## 7. Non-Functional Requirements
- Smooth animations  
- Local-first  
- Robust error-handling  
- Low battery usage  
- Strict privacy  
- Accessibility compliant  

---

## 8. Scope Breakdown

### MVP
- Dashboard  
- Transactions  
- Add transaction  
- SMS parsing + pending queue  
- Categories + accounts  
- Basic budgets  
- Basic subscriptions  
- Local DB + encrypted sync  
- Light/Dark theme  

### Version 1.1
- Learning Mode  
- What-if sliders  
- Goals module  
- Theme customization  
- Dashboard widgets  

### Version 2.0
- Investments  
- Net worth tracking  
- Tax reports  
- Bank sync  

---

## 9. Risks & Mitigation
| Risk | Mitigation |
|------|-------------|
| SMS format variance | Rule engine + fallback manual mode |
| Sync conflicts | Last-write-wins + merge preview |
| User overwhelm | Zen UI + progressive disclosure |
| Data privacy | Full local processing + encryption |
| AI inaccuracies | Strict templates + validation |

---

## 10. Acceptance Criteria
- 100% local functionality  
- SMS parsing accuracy >85%  
- Seamless sync  
- Clean UI  
- Quick expense entry (<5 seconds)  
- Full category + account customization  

[INSERT FULL PRD.md CONTENT HERE]