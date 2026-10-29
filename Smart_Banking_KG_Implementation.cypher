// ============================================================
// KNOWLEDGE GRAPH IMPLEMENTATION USING NEO4J
// Project: Smart Digital Banking System with Real-Time Fraud Detection
// Authors: Srijan Sengupta (24BCE2218) & Shubho Das (24BCE2276)
// Tool: Neo4j Aura (AuraDB Free)
// Language: Cypher Query Language
// ============================================================


// =========================
// PART 1: CREATE NODES
// =========================
// Total: 38 nodes across 7 entity types
// Entity Types: Customer, Account, Transaction, Merchant, Device, Location, FraudAlert

// --- Customers (5 nodes) ---
CREATE (c1:Customer {customer_id: 'C001', name: 'Aarav Sharma', email: 'aarav@email.com', phone: '+91-9876543210', risk_score: 0.15, kyc_verified: true})
CREATE (c2:Customer {customer_id: 'C002', name: 'Priya Patel', email: 'priya@email.com', phone: '+91-9876543211', risk_score: 0.08, kyc_verified: true})
CREATE (c3:Customer {customer_id: 'C003', name: 'Vikram Singh', email: 'vikram@email.com', phone: '+91-9876543212', risk_score: 0.72, kyc_verified: true})
CREATE (c4:Customer {customer_id: 'C004', name: 'Neha Gupta', email: 'neha@email.com', phone: '+91-9876543213', risk_score: 0.05, kyc_verified: true})
CREATE (c5:Customer {customer_id: 'C005', name: 'Rahul Verma', email: 'rahul@email.com', phone: '+91-9876543214', risk_score: 0.85, kyc_verified: false})

// --- Accounts (6 nodes) ---
CREATE (a1:Account {account_id: 'A001', account_type: 'savings', balance: 250000.00, currency: 'INR', status: 'active'})
CREATE (a2:Account {account_id: 'A002', account_type: 'checking', balance: 85000.00, currency: 'INR', status: 'active'})
CREATE (a3:Account {account_id: 'A003', account_type: 'savings', balance: 520000.00, currency: 'INR', status: 'frozen'})
CREATE (a4:Account {account_id: 'A004', account_type: 'credit', balance: 150000.00, currency: 'INR', status: 'active'})
CREATE (a5:Account {account_id: 'A005', account_type: 'savings', balance: 45000.00, currency: 'INR', status: 'active'})
CREATE (a6:Account {account_id: 'A006', account_type: 'checking', balance: 320000.00, currency: 'INR', status: 'active'})

// --- Merchants (5 nodes) ---
CREATE (m1:Merchant {merchant_id: 'M001', name: 'Amazon India', category: 'online', risk_level: 'low'})
CREATE (m2:Merchant {merchant_id: 'M002', name: 'Suspicious Forex Ltd', category: 'forex', risk_level: 'high'})
CREATE (m3:Merchant {merchant_id: 'M003', name: 'Big Bazaar', category: 'retail', risk_level: 'low'})
CREATE (m4:Merchant {merchant_id: 'M004', name: 'ATM-SBI-Chennai', category: 'atm', risk_level: 'medium'})
CREATE (m5:Merchant {merchant_id: 'M005', name: 'CryptoExchange247', category: 'crypto', risk_level: 'high'})

// --- Devices (5 nodes) ---
CREATE (d1:Device {device_id: 'D001', device_type: 'mobile', os: 'Android 14', ip_address: '192.168.1.10', is_trusted: true})
CREATE (d2:Device {device_id: 'D002', device_type: 'desktop', os: 'Windows 11', ip_address: '103.25.48.77', is_trusted: true})
CREATE (d3:Device {device_id: 'D003', device_type: 'mobile', os: 'iOS 17', ip_address: '45.33.128.99', is_trusted: false})
CREATE (d4:Device {device_id: 'D004', device_type: 'atm', os: 'ATM-OS', ip_address: '10.0.0.55', is_trusted: true})
CREATE (d5:Device {device_id: 'D005', device_type: 'mobile', os: 'Android 13', ip_address: '185.220.101.42', is_trusted: false})

// --- Locations (5 nodes) ---
CREATE (l1:Location {location_id: 'L001', city: 'Chennai', country: 'India', latitude: 13.0827, longitude: 80.2707})
CREATE (l2:Location {location_id: 'L002', city: 'Mumbai', country: 'India', latitude: 19.0760, longitude: 72.8777})
CREATE (l3:Location {location_id: 'L003', city: 'Lagos', country: 'Nigeria', latitude: 6.5244, longitude: 3.3792})
CREATE (l4:Location {location_id: 'L004', city: 'Vellore', country: 'India', latitude: 12.9165, longitude: 79.1325})
CREATE (l5:Location {location_id: 'L005', city: 'Moscow', country: 'Russia', latitude: 55.7558, longitude: 37.6173})

// --- Transactions (8 nodes) ---
CREATE (t1:Transaction {txn_id: 'T001', amount: 2500.00, txn_type: 'debit', timestamp: '2024-09-15T10:30:00', is_flagged: false, fraud_score: 0.05})
CREATE (t2:Transaction {txn_id: 'T002', amount: 75000.00, txn_type: 'transfer', timestamp: '2024-09-15T23:45:00', is_flagged: true, fraud_score: 0.89})
CREATE (t3:Transaction {txn_id: 'T003', amount: 1200.00, txn_type: 'debit', timestamp: '2024-09-16T14:20:00', is_flagged: false, fraud_score: 0.02})
CREATE (t4:Transaction {txn_id: 'T004', amount: 450000.00, txn_type: 'transfer', timestamp: '2024-09-16T03:10:00', is_flagged: true, fraud_score: 0.95})
CREATE (t5:Transaction {txn_id: 'T005', amount: 8500.00, txn_type: 'debit', timestamp: '2024-09-17T11:00:00', is_flagged: false, fraud_score: 0.12})
CREATE (t6:Transaction {txn_id: 'T006', amount: 120000.00, txn_type: 'transfer', timestamp: '2024-09-17T02:30:00', is_flagged: true, fraud_score: 0.91})
CREATE (t7:Transaction {txn_id: 'T007', amount: 3200.00, txn_type: 'credit', timestamp: '2024-09-17T09:00:00', is_flagged: false, fraud_score: 0.03})
CREATE (t8:Transaction {txn_id: 'T008', amount: 95000.00, txn_type: 'transfer', timestamp: '2024-09-18T01:15:00', is_flagged: true, fraud_score: 0.88})

// --- Fraud Alerts (4 nodes) ---
CREATE (fa1:FraudAlert {alert_id: 'FA001', alert_type: 'amount_spike', severity: 'high', status: 'investigating'})
CREATE (fa2:FraudAlert {alert_id: 'FA002', alert_type: 'geo_anomaly', severity: 'critical', status: 'open'})
CREATE (fa3:FraudAlert {alert_id: 'FA003', alert_type: 'velocity', severity: 'high', status: 'investigating'})
CREATE (fa4:FraudAlert {alert_id: 'FA004', alert_type: 'device_change', severity: 'medium', status: 'resolved'});


// ====================================
// PART 2: CREATE RELATIONSHIPS
// ====================================
// Total: 49 relationships across 10 relationship types
// Relationship Types: OWNS_ACCOUNT, INITIATED, RECEIVED, MADE_AT,
//                     USED_DEVICE, LOCATED_IN, TRIGGERED_ALERT,
//                     ALERT_FOR, TRANSFERS_TO

// --- Customer OWNS_ACCOUNT Account ---
MATCH (c1:Customer {customer_id: 'C001'}), (a1:Account {account_id: 'A001'}) CREATE (c1)-[:OWNS_ACCOUNT]->(a1)
WITH 1 as dummy
MATCH (c1:Customer {customer_id: 'C001'}), (a6:Account {account_id: 'A006'}) CREATE (c1)-[:OWNS_ACCOUNT]->(a6)
WITH 1 as dummy
MATCH (c2:Customer {customer_id: 'C002'}), (a2:Account {account_id: 'A002'}) CREATE (c2)-[:OWNS_ACCOUNT]->(a2)
WITH 1 as dummy
MATCH (c3:Customer {customer_id: 'C003'}), (a3:Account {account_id: 'A003'}) CREATE (c3)-[:OWNS_ACCOUNT]->(a3)
WITH 1 as dummy
MATCH (c4:Customer {customer_id: 'C004'}), (a4:Account {account_id: 'A004'}) CREATE (c4)-[:OWNS_ACCOUNT]->(a4)
WITH 1 as dummy
MATCH (c5:Customer {customer_id: 'C005'}), (a5:Account {account_id: 'A005'}) CREATE (c5)-[:OWNS_ACCOUNT]->(a5)
WITH 1 as dummy

// --- Account INITIATED Transaction ---
MATCH (a1:Account {account_id: 'A001'}), (t1:Transaction {txn_id: 'T001'}) CREATE (a1)-[:INITIATED]->(t1)
WITH 1 as dummy
MATCH (a3:Account {account_id: 'A003'}), (t2:Transaction {txn_id: 'T002'}) CREATE (a3)-[:INITIATED]->(t2)
WITH 1 as dummy
MATCH (a2:Account {account_id: 'A002'}), (t3:Transaction {txn_id: 'T003'}) CREATE (a2)-[:INITIATED]->(t3)
WITH 1 as dummy
MATCH (a3:Account {account_id: 'A003'}), (t4:Transaction {txn_id: 'T004'}) CREATE (a3)-[:INITIATED]->(t4)
WITH 1 as dummy
MATCH (a4:Account {account_id: 'A004'}), (t5:Transaction {txn_id: 'T005'}) CREATE (a4)-[:INITIATED]->(t5)
WITH 1 as dummy
MATCH (a5:Account {account_id: 'A005'}), (t6:Transaction {txn_id: 'T006'}) CREATE (a5)-[:INITIATED]->(t6)
WITH 1 as dummy
MATCH (a1:Account {account_id: 'A001'}), (t7:Transaction {txn_id: 'T007'}) CREATE (a1)-[:INITIATED]->(t7)
WITH 1 as dummy
MATCH (a5:Account {account_id: 'A005'}), (t8:Transaction {txn_id: 'T008'}) CREATE (a5)-[:INITIATED]->(t8)
WITH 1 as dummy

// --- Transaction RECEIVED by Account (for transfers) ---
MATCH (t2:Transaction {txn_id: 'T002'}), (a5:Account {account_id: 'A005'}) CREATE (t2)-[:RECEIVED]->(a5)
WITH 1 as dummy
MATCH (t4:Transaction {txn_id: 'T004'}), (a5:Account {account_id: 'A005'}) CREATE (t4)-[:RECEIVED]->(a5)
WITH 1 as dummy
MATCH (t6:Transaction {txn_id: 'T006'}), (a3:Account {account_id: 'A003'}) CREATE (t6)-[:RECEIVED]->(a3)
WITH 1 as dummy
MATCH (t8:Transaction {txn_id: 'T008'}), (a3:Account {account_id: 'A003'}) CREATE (t8)-[:RECEIVED]->(a3)
WITH 1 as dummy

// --- Transaction MADE_AT Merchant ---
MATCH (t1:Transaction {txn_id: 'T001'}), (m1:Merchant {merchant_id: 'M001'}) CREATE (t1)-[:MADE_AT]->(m1)
WITH 1 as dummy
MATCH (t2:Transaction {txn_id: 'T002'}), (m5:Merchant {merchant_id: 'M005'}) CREATE (t2)-[:MADE_AT]->(m5)
WITH 1 as dummy
MATCH (t3:Transaction {txn_id: 'T003'}), (m3:Merchant {merchant_id: 'M003'}) CREATE (t3)-[:MADE_AT]->(m3)
WITH 1 as dummy
MATCH (t4:Transaction {txn_id: 'T004'}), (m2:Merchant {merchant_id: 'M002'}) CREATE (t4)-[:MADE_AT]->(m2)
WITH 1 as dummy
MATCH (t5:Transaction {txn_id: 'T005'}), (m4:Merchant {merchant_id: 'M004'}) CREATE (t5)-[:MADE_AT]->(m4)
WITH 1 as dummy
MATCH (t6:Transaction {txn_id: 'T006'}), (m5:Merchant {merchant_id: 'M005'}) CREATE (t6)-[:MADE_AT]->(m5)
WITH 1 as dummy
MATCH (t8:Transaction {txn_id: 'T008'}), (m2:Merchant {merchant_id: 'M002'}) CREATE (t8)-[:MADE_AT]->(m2)
WITH 1 as dummy

// --- Transaction USED_DEVICE Device ---
MATCH (t1:Transaction {txn_id: 'T001'}), (d1:Device {device_id: 'D001'}) CREATE (t1)-[:USED_DEVICE]->(d1)
WITH 1 as dummy
MATCH (t2:Transaction {txn_id: 'T002'}), (d3:Device {device_id: 'D003'}) CREATE (t2)-[:USED_DEVICE]->(d3)
WITH 1 as dummy
MATCH (t3:Transaction {txn_id: 'T003'}), (d2:Device {device_id: 'D002'}) CREATE (t3)-[:USED_DEVICE]->(d2)
WITH 1 as dummy
MATCH (t4:Transaction {txn_id: 'T004'}), (d5:Device {device_id: 'D005'}) CREATE (t4)-[:USED_DEVICE]->(d5)
WITH 1 as dummy
MATCH (t5:Transaction {txn_id: 'T005'}), (d4:Device {device_id: 'D004'}) CREATE (t5)-[:USED_DEVICE]->(d4)
WITH 1 as dummy
MATCH (t6:Transaction {txn_id: 'T006'}), (d5:Device {device_id: 'D005'}) CREATE (t6)-[:USED_DEVICE]->(d5)
WITH 1 as dummy
MATCH (t8:Transaction {txn_id: 'T008'}), (d3:Device {device_id: 'D003'}) CREATE (t8)-[:USED_DEVICE]->(d3)
WITH 1 as dummy

// --- Transaction LOCATED_IN Location ---
MATCH (t1:Transaction {txn_id: 'T001'}), (l1:Location {location_id: 'L001'}) CREATE (t1)-[:LOCATED_IN]->(l1)
WITH 1 as dummy
MATCH (t2:Transaction {txn_id: 'T002'}), (l3:Location {location_id: 'L003'}) CREATE (t2)-[:LOCATED_IN]->(l3)
WITH 1 as dummy
MATCH (t3:Transaction {txn_id: 'T003'}), (l2:Location {location_id: 'L002'}) CREATE (t3)-[:LOCATED_IN]->(l2)
WITH 1 as dummy
MATCH (t4:Transaction {txn_id: 'T004'}), (l5:Location {location_id: 'L005'}) CREATE (t4)-[:LOCATED_IN]->(l5)
WITH 1 as dummy
MATCH (t5:Transaction {txn_id: 'T005'}), (l4:Location {location_id: 'L004'}) CREATE (t5)-[:LOCATED_IN]->(l4)
WITH 1 as dummy
MATCH (t6:Transaction {txn_id: 'T006'}), (l3:Location {location_id: 'L003'}) CREATE (t6)-[:LOCATED_IN]->(l3)
WITH 1 as dummy
MATCH (t8:Transaction {txn_id: 'T008'}), (l5:Location {location_id: 'L005'}) CREATE (t8)-[:LOCATED_IN]->(l5)
WITH 1 as dummy

// --- Transaction TRIGGERED_ALERT FraudAlert ---
MATCH (t2:Transaction {txn_id: 'T002'}), (fa1:FraudAlert {alert_id: 'FA001'}) CREATE (t2)-[:TRIGGERED_ALERT]->(fa1)
WITH 1 as dummy
MATCH (t4:Transaction {txn_id: 'T004'}), (fa2:FraudAlert {alert_id: 'FA002'}) CREATE (t4)-[:TRIGGERED_ALERT]->(fa2)
WITH 1 as dummy
MATCH (t6:Transaction {txn_id: 'T006'}), (fa3:FraudAlert {alert_id: 'FA003'}) CREATE (t6)-[:TRIGGERED_ALERT]->(fa3)
WITH 1 as dummy
MATCH (t8:Transaction {txn_id: 'T008'}), (fa4:FraudAlert {alert_id: 'FA004'}) CREATE (t8)-[:TRIGGERED_ALERT]->(fa4)
WITH 1 as dummy

// --- FraudAlert ALERT_FOR Customer ---
MATCH (fa1:FraudAlert {alert_id: 'FA001'}), (c3:Customer {customer_id: 'C003'}) CREATE (fa1)-[:ALERT_FOR]->(c3)
WITH 1 as dummy
MATCH (fa2:FraudAlert {alert_id: 'FA002'}), (c3:Customer {customer_id: 'C003'}) CREATE (fa2)-[:ALERT_FOR]->(c3)
WITH 1 as dummy
MATCH (fa3:FraudAlert {alert_id: 'FA003'}), (c5:Customer {customer_id: 'C005'}) CREATE (fa3)-[:ALERT_FOR]->(c5)
WITH 1 as dummy
MATCH (fa4:FraudAlert {alert_id: 'FA004'}), (c5:Customer {customer_id: 'C005'}) CREATE (fa4)-[:ALERT_FOR]->(c5)
WITH 1 as dummy

// --- Customer TRANSFERS_TO Customer (money flow patterns) ---
MATCH (c3:Customer {customer_id: 'C003'}), (c5:Customer {customer_id: 'C005'}) CREATE (c3)-[:TRANSFERS_TO {frequency: 5, total_amount: 645000.00}]->(c5)
WITH 1 as dummy
MATCH (c5:Customer {customer_id: 'C005'}), (c3:Customer {customer_id: 'C003'}) CREATE (c5)-[:TRANSFERS_TO {frequency: 3, total_amount: 215000.00}]->(c3);


// ====================================
// PART 3: ANALYTICAL QUERIES
// ====================================

// --------------------------------------------------
// QUERY 1: Visualize the Entire Knowledge Graph
// --------------------------------------------------
MATCH (n)-[r]->(m) RETURN n, r, m;


// --------------------------------------------------
// QUERY 2: Find All Flagged (Suspicious) Transactions
// Purpose: Identify transactions with high fraud scores
// --------------------------------------------------
MATCH (t:Transaction)
WHERE t.is_flagged = true
RETURN t.txn_id AS TransactionID,
       t.amount AS Amount,
       t.fraud_score AS FraudScore,
       t.txn_type AS Type
ORDER BY t.fraud_score DESC;

// Expected Output:
// | TransactionID | Amount     | FraudScore | Type     |
// |---------------|------------|------------|----------|
// | T004          | 450000.00  | 0.95       | transfer |
// | T006          | 120000.00  | 0.91       | transfer |
// | T002          | 75000.00   | 0.89       | transfer |
// | T008          | 95000.00   | 0.88       | transfer |


// --------------------------------------------------
// QUERY 3: Trace Full Path of a Suspicious Transaction
// Purpose: Track T004 across Customer, Account, Merchant,
//          Device, Location, and FraudAlert
// --------------------------------------------------
MATCH (c:Customer)-[:OWNS_ACCOUNT]->(a:Account)-[:INITIATED]->(t:Transaction {txn_id: 'T004'})
OPTIONAL MATCH (t)-[:MADE_AT]->(m:Merchant)
OPTIONAL MATCH (t)-[:USED_DEVICE]->(d:Device)
OPTIONAL MATCH (t)-[:LOCATED_IN]->(l:Location)
OPTIONAL MATCH (t)-[:TRIGGERED_ALERT]->(fa:FraudAlert)
RETURN c, a, t, m, d, l, fa;

// Expected: Vikram Singh -> A003 -> T004 (Rs 4,50,000)
//           -> Suspicious Forex Ltd, untrusted mobile from Moscow,
//           -> critical geo_anomaly alert


// --------------------------------------------------
// QUERY 4: High-Risk Customers with Fraud Alerts
// Purpose: Find customers with risk_score > 0.7 and
//          their associated alerts
// --------------------------------------------------
MATCH (c:Customer)
WHERE c.risk_score > 0.7
OPTIONAL MATCH (fa:FraudAlert)-[:ALERT_FOR]->(c)
RETURN c.name AS Customer,
       c.risk_score AS RiskScore,
       c.kyc_verified AS KYC,
       collect(fa.alert_type) AS Alerts,
       count(fa) AS TotalAlerts
ORDER BY c.risk_score DESC;

// Expected Output:
// | Customer      | RiskScore | KYC   | Alerts                          | TotalAlerts |
// |---------------|-----------|-------|---------------------------------|-------------|
// | Rahul Verma   | 0.85      | false | [velocity, device_change]       | 2           |
// | Vikram Singh  | 0.72      | true  | [amount_spike, geo_anomaly]     | 2           |


// --------------------------------------------------
// QUERY 5: Detect Circular Money Flow (Money Laundering)
// Purpose: Find Customer A -> Customer B -> Customer A
//          transfer loops
// --------------------------------------------------
MATCH (c1:Customer)-[r1:TRANSFERS_TO]->(c2:Customer)-[r2:TRANSFERS_TO]->(c1)
RETURN c1.name AS Customer1,
       c2.name AS Customer2,
       r1.total_amount AS C1_to_C2,
       r2.total_amount AS C2_to_C1,
       r1.frequency + r2.frequency AS TotalTransfers;

// Expected Output:
// | Customer1     | Customer2    | C1_to_C2   | C2_to_C1   | TotalTransfers |
// |---------------|--------------|------------|------------|----------------|
// | Vikram Singh  | Rahul Verma  | 645000.00  | 215000.00  | 8              |
// | Rahul Verma   | Vikram Singh | 215000.00  | 645000.00  | 8              |


// --------------------------------------------------
// QUERY 6: Untrusted Devices at High-Risk Merchants
// Purpose: Find suspicious device + merchant combinations
// --------------------------------------------------
MATCH (c:Customer)-[:OWNS_ACCOUNT]->(a:Account)-[:INITIATED]->(t:Transaction)-[:USED_DEVICE]->(d:Device),
      (t)-[:MADE_AT]->(m:Merchant)
WHERE d.is_trusted = false AND m.risk_level = 'high'
RETURN c.name AS Customer,
       t.txn_id AS Txn,
       t.amount AS Amount,
       m.name AS Merchant,
       d.device_type AS Device,
       d.ip_address AS IP;

// Expected Output:
// | Customer      | Txn  | Amount     | Merchant             | Device | IP              |
// |---------------|------|-----------|----------------------|--------|-----------------|
// | Vikram Singh  | T004 | 450000.00 | Suspicious Forex Ltd | mobile | 185.220.101.42  |
// | Rahul Verma   | T006 | 120000.00 | CryptoExchange247    | mobile | 185.220.101.42  |


// --------------------------------------------------
// QUERY 7: Knowledge Graph Statistics
// Purpose: Count nodes by type
// --------------------------------------------------
MATCH (n)
RETURN labels(n)[0] AS NodeType, count(n) AS Count
ORDER BY Count DESC;

// Expected Output:
// | NodeType    | Count |
// |-------------|-------|
// | Transaction | 8     |
// | Account     | 6     |
// | Customer    | 5     |
// | Merchant    | 5     |
// | Device      | 5     |
// | Location    | 5     |
// | FraudAlert  | 4     |
// Total: 38 nodes, 49 relationships


// --------------------------------------------------
// QUERY 8: Shortest Path Between Two Customers
// Purpose: Discover hidden connections between
//          Aarav Sharma and Rahul Verma
// --------------------------------------------------
MATCH path = shortestPath(
  (c1:Customer {name: 'Aarav Sharma'})-[*]-(c2:Customer {name: 'Rahul Verma'})
)
RETURN path;


// ====================================
// PART 4: CLEANUP (Optional — run only to reset)
// ====================================
// MATCH (n) DETACH DELETE n;
