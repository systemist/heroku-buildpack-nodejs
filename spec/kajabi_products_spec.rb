require_relative './spec_helper'

describe "kajabi_products" do
  let(:app) {
    buildpacks = [
      :default,
      "https://github.com/heroku/heroku-buildpack-ruby.git"
    ]

    Hatchet::Runner.new("/Users/jacob/Code/kajabi/kajabi-products",
      buildpacks: buildpacks,
      config: {
        "NPM_CONFIG_GITHUB_AUTH_TOKEN" => ENV["NPM_CONFIG_GITHUB_AUTH_TOKEN"],
        "NODE_VERBOSE" => "true",
        "NODE_MODULES_CACHE" => "false",
        "USE_YARN_CACHE" => "false",
        "YARN_PRODUCTION" => "false",
        "NPM_CONFIG_PRODUCTION" => "false",
        "YARN_NETWORK_CONCURRENCY" => "1",
        "NODE_ENV" => "staging",
      }
    )
  }

  it "should deploy successfully" do
    app.deploy do |app|
      expect(successful_body(app).strip).to eq("Hello, world!")
    end
  end
end
