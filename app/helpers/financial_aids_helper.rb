module FinancialAidsHelper
    def financial_aid_status
        [
          ['pending', 'pending'],
          ['awarded', 'awarded'],
          ['rejected', 'rejected'],
        ]
      end
end
