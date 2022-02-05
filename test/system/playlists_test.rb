require "application_system_test_case"

class PlaylistsTest < ApplicationSystemTestCase
  setup do
    @playlist = playlists(:one)
  end

  test "visiting the index" do
    visit playlists_url
    assert_selector "h1", text: "Playlists"
  end

  test "creating a Playlist" do
    visit playlists_url
    click_on "New Playlist"

    fill_in "Channel", with: @playlist.channel_id
    check "Completed" if @playlist.completed
    fill_in "Duration", with: @playlist.duration
    fill_in "Finish episode", with: @playlist.finish_episode
    fill_in "Image url", with: @playlist.image_url
    fill_in "Last updated", with: @playlist.last_updated
    fill_in "Rating", with: @playlist.rating
    fill_in "Sequence", with: @playlist.sequence
    fill_in "Title", with: @playlist.title
    fill_in "Topic", with: @playlist.topic_id
    fill_in "Total episode", with: @playlist.total_episode
    fill_in "Url", with: @playlist.url
    fill_in "Views", with: @playlist.views
    click_on "Create Playlist"

    assert_text "Playlist was successfully created"
    click_on "Back"
  end

  test "updating a Playlist" do
    visit playlists_url
    click_on "Edit", match: :first

    fill_in "Channel", with: @playlist.channel_id
    check "Completed" if @playlist.completed
    fill_in "Duration", with: @playlist.duration
    fill_in "Finish episode", with: @playlist.finish_episode
    fill_in "Image url", with: @playlist.image_url
    fill_in "Last updated", with: @playlist.last_updated
    fill_in "Rating", with: @playlist.rating
    fill_in "Sequence", with: @playlist.sequence
    fill_in "Title", with: @playlist.title
    fill_in "Topic", with: @playlist.topic_id
    fill_in "Total episode", with: @playlist.total_episode
    fill_in "Url", with: @playlist.url
    fill_in "Views", with: @playlist.views
    click_on "Update Playlist"

    assert_text "Playlist was successfully updated"
    click_on "Back"
  end

  test "destroying a Playlist" do
    visit playlists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Playlist was successfully destroyed"
  end
end
