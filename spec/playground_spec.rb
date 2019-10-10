require 'pry'
require_relative '../lib/hecks-adapters/dynamodb'
require 'hecks-app'
require 'soccer_season'

App = HecksApp::ApplicationPort

App.config do
  domain SoccerSeason
  adapter :Dynamodb
end

describe 'Playground' do
  let(:red_team) { App[:Teams].build(name: 'redteam').tap(&:save).as_json.deep_symbolize_keys }
  let(:blue_team) { App[:Teams].build(name: 'blueteam').tap(&:save).as_json.deep_symbolize_keys }

  let(:player) do
    App[:Players].build(name: 'Chris', team: red_team).tap(&:save)
  end

  let(:pitch) { App[:Pitches].build(name: 'backyard').tap(&:save) }

  let(:fixture) do
    {
      season: 'summer',
      date: Date.today,
      time: Time.now
    }
  end

  let(:match) do
    App[:Matches].build(
      fixture: fixture,
      teams: [red_team, blue_team],
      pitch: pitch.as_json.deep_symbolize_keys
    ).tap(&:save)
  end

  it '#save' do
    team = App[:Teams].build(name: 'redteam')
    App[team].save
    expect(App[:Teams].fetch(team.id)).to be
  end

  it '#all' do
    team = App[:Teams].build(name: 'redteam')
    team = App[team].save
    expect(App[:Teams].all.map(&:id)).to include team.id
  end

  it '#destroy' do
    team = App[:Teams].build(name: 'redteam')
    team = App[team].save
    App[team].destroy
    expect(App[:Teams].all.map(&:id)).to_not include team.id
  end
end
