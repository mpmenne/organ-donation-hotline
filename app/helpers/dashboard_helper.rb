module DashboardHelper

  def mask_phone(phone_number)
    phone_number.sub(phone_number.last(4), 'XXXX')
  end

  def format_phone(phone_number)
    number_to_phone(phone_number.sub('+1', ''), area_code: true)
  end

  def format_date(date)
    date.strftime('%B%e, %Y')
  end
end
