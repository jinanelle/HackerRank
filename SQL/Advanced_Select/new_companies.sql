/*
Each of the companies follows this hierarchy: 
Founder => Lead Manager => Senior Manager => Manager => Employee

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric.

Input Format
- Company 
    company_code : string
    founder : string
- Lead_Manager
    lead_manager_code : string
    company_code : string
- Senior_Manager
    senior_manager_code : string
    lead_manager_code : string
    company_code : string
- Manager
    manager_code : string
    senior_manager_code : string
    lead_manager_code : string
    company_code : string
- Employee
    employee_code : string
    manager_code : string
    senior_manager_code : string
    lead_manager_code : string
    company_code : string

Sample Output
C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2

Explanation
- In company C1, the only lead manager is LM1. There are two senior managers, SM1 and SM2, under LM1. There is one manager, M1, under senior manager SM1. There are two employees, E1 and E2, under manager M1.

*/

-- Employee Table includes already the other codes

SELECT c.company_code, c.founder,
    COUNT(DISTINCT e.lead_manager_code),
    COUNT(DISTINCT e.senior_manager_code),
    COUNT(DISTINCT e.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM Company c
JOIN Employee e ON e.company_code = c.company_code
GROUP BY 1,2
ORDER BY 1 ASC

-- OR

SELECT c.company_code, c.founder,
    (SELECT COUNT(DISTINCT lead_manager_code) FROM Lead_Manager 
    WHERE company_code = c.company_code),
    (SELECT COUNT(DISTINCT senior_manager_code) FROM Senior_Manager 
    WHERE company_code = c.company_code),
    (SELECT COUNT(DISTINCT manager_code) FROM Manager 
    WHERE company_code = c.company_code),
    (SELECT COUNT(DISTINCT employee_code) FROM Employee 
    WHERE company_code = c.company_code)
FROM Company c
ORDER BY 1 ASC

-- OR

SELECT c.company_code, c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM Company c
JOIN Lead_Manager lm ON lm.company_code = c.company_code
JOIN Senior_Manager sm ON sm.company_code = c.company_code
JOIN Manager m ON m.company_code = c.company_code
JOIN Employee e ON e.company_code = c.company_code
GROUP BY 1,2
ORDER BY 1 ASC

-- OR

SELECT c.company_code, c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM 
    Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e
WHERE
    lm.company_code = c.company_code AND
    sm.company_code = c.company_code AND
    m.company_code = c.company_code AND
    e.company_code = c.company_code
GROUP BY 1,2
ORDER BY 1 ASC