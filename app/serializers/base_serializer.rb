
class BaseSerializer < ActiveModel::Serializer
  attribute :meta, if: :load_meta?

  def meta
    instance_options[:extra]
  end

  def load_meta?
    instance_options[:extra].present?
  end
end