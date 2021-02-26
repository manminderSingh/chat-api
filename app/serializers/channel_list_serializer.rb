class ChannelListSerializer < ActiveModel::Serializer
    attributes :name, :id, :created_at, :updated_at

    def id
      object.id.to_s
    end
end
