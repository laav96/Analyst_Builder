-- Moderate Level: 25 points

-- My Boss wants a report that shows each employee and their bosses name so he can try to memorize it before our quarterly social event. Provide an output that includes the employee name matched with the name of their boss. If they don't have a boss still include them in the output. Order output on employee name alphabetically.

SELECT b.employee_name, bb.employee_name AS Boss_Name
  FROM boss b
  LEFT JOIN boss bb
    ON b.boss_id = bb.employee_id
  ORDER BY employee_name;
