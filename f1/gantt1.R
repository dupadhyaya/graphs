# Gantt Chart


library(DiagrammeR)
mermaid("
        gantt
        dateFormat  YYYY-MM-DD
        title A Very Nice Gantt Diagram
        
        section Basic Tasks
        This is completed             :done,          first_1,    2014-01-06, 2014-01-08
        This is active                :active,        first_2,    2014-01-09, 3d
        Do this later                 :               first_3,    after first_2, 5d
        Do this after that            :               first_4,    after first_3, 5d
        
        section Important Things
        Completed, critical task      :crit, done,    import_1,   2014-01-06,24h
        Also done, also critical      :crit, done,    import_2,   after import_1, 2d
        Doing this important task now :crit, active,  import_3,   after import_2, 3d
        Next critical task            :crit,          import_4,   after import_3, 5d
        
        section The Extras
        First extras                  :active,        extras_1,   after import_4,  3d
        Second helping                :               extras_2,   after extras_1, 20h
        More of the extras            :               extras_3,   after extras_1, 48h
        ")

