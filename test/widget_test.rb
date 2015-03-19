$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

require 'minitest/autorun'
require 'widget'

class TestWidget < Minitest::Test
  def setup
    @widget = Widget.new(abc: '123')
  end

  def test_that_widget_responds_to_setter_methods
    assert @widget.respond_to?(:xyz=)
  end

  def test_that_widget_has_setter_method
    assert @widget.method(:xyz=)
  end

  def test_that_widget_responds_to_interpolated_setter_method
    suffix = '='
    setter_method = :"zyx#{suffix}"
    assert @widget.respond_to?(setter_method)
  end

  def test_that_widget_has_interpolated_setter_method
    suffix = '='
    setter_method = :"zyx#{suffix}"
    assert @widget.method(setter_method)
  end
end
