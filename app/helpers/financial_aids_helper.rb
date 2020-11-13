module FinancialAidsHelper
    def financial_aid_status
        [
          ['*Select*', ''],
          ['pending', 'pending'],
          ['awarded', 'awarded'],
          ['rejected', 'rejected'],
        ]
      end
end
