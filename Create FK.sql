ALTER TABLE JobCodeHistory
   ADD CONSTRAINT FK_JobCodeHist_Person FOREIGN KEY (EmpNumber)
      REFERENCES Person (EmpNumber)
;