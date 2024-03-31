class BaseService
  def self.run *args
    new(*args).run
  end

  def run
    raise NotImplementedError
  end
end
