PASS
====


Remove dupplication in tests using a before
```
before(:each) do
  airport.stub(:weather_selector).and_return('sunny')
end
```
