to_euro= lambda {|dollars| dollars*0.95}
to_pesos= lambda {|dollars| dollars*20.67}
to_rupees= lambda {|dollars| dollars*68.13}
def convert(dollars,currency_lambda)
  currency_lambda.call(dollars) if dollars.is_a?(Numeric)
end

# def convert_to_euro(dollars)
#     dollars *0.95  if dollars.is_a?(Numeric)
# end
#
# def convert_to_pesos(dollars)
#     dollars *20.67  if dollars.is_a?(Numeric)
# end
#
# def convert_to_rupees(dollars)
#     dollars *68.13 if dollars.is_a?(Numeric)
# end

p convert(1000,to_euro)
p convert(1000,to_pesos)
p convert(1000,to_rupees)
