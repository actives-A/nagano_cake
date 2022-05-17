class Order < ApplicationRecord
  enum cash_mean:{
      credit_card:0,
      transfer:1
  }
end