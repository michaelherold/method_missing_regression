##
# A simple class that wraps a Hash and allows method access.
#
# = Example
#
#   widget = Widget.new(abc: '123')
#
#   widget.abc == '123'  #=> true
#   widget.abc = '456'
#   widget.abc == '456'  #=> true
#
#   widget.xyz = '987'
#   widget.xyz == '987'  #=> true
class Widget
  def initialize(attrs = {})
    @attrs = stringify(attrs)
  end

  def method_missing(method_name, *args)
    method_name = method_name.to_s
    return @attrs[method_name] if @attrs.key?(method_name)

    name, suffix = method_suffix(method_name)

    case suffix
    when '=' then @attrs[name] = args.first
    else @attrs[method_name]
    end
  end

  def respond_to_missing?(method_name, *)
    method_name = method_name.to_s
    return true if @attrs.key?(method_name)

    _, suffix = method_suffix(method_name)

    case suffix
    when '=' then return true
    else super
    end
  end

  private

  def method_suffix(method_name)
    match = method_name.match(/(.*?)(=?)$/)
    [match[1], match[2]]
  end

  def stringify(attrs)
    attrs.reduce({}) do |hash, (key, value)|
      hash[key.to_s] = value
      hash
    end
  end
end
