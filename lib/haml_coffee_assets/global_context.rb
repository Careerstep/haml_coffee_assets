module HamlCoffeeAssets
  class GlobalContext
    def self.asset
      find_asset(asset_path)
    end

    def self.asset_path
      ::HamlCoffeeAssets.config.global_context_asset
    end

    def self.mtime
      return nil unless asset.respond_to?(:mtime)
      asset.mtime
    end

    def self.body
      return "" if asset.blank?
      asset.body
    end

    def self.to_s
      return "" if asset.blank?
      asset.to_s
    end

    private

    def self.env
      ::Rails.application.assets
    end

    def self.find_asset(name)
      return "" unless ::Rails.respond_to?(:application)
      return "" unless ::Rails.application.respond_to?(:assets)
      # env.find_asset(name)
      puts "============for debugging: name ============", name
      puts "============for debugging: Rails.application.assets  ============", Rails.application.assets
      puts "============for debugging: env.find_asset(name)  ============", env.find_asset(name)
      puts "============for debugging: hacky fix  ============", Rails.application.assets_manifest.files.values.map{|v| v['logical_path']}.include?('#{name}')

      env.find_asset(name)
    end
  end
end
