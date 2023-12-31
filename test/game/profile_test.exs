defmodule Game.ProfileTest do
  use Game.DataCase

  alias Game.Profile

  describe "users" do
    alias Game.Profile.User

    import Game.ProfileFixtures

    @invalid_attrs %{name: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Profile.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Profile.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %User{} = user} = Profile.create_user(valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %User{} = user} = Profile.update_user(user, update_attrs)
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_user(user, @invalid_attrs)
      assert user == Profile.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Profile.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Profile.change_user(user)
    end
  end

  describe "users" do
    alias Game.Profile.User

    import Game.ProfileFixtures

    @invalid_attrs %{email: nil, scopes: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Profile.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Profile.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        email: "some email",
        scopes: ["option1", "option2"],
        username: "some username"
      }

      assert {:ok, %User{} = user} = Profile.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.scopes == ["option1", "option2"]
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        email: "some updated email",
        scopes: ["option1"],
        username: "some updated username"
      }

      assert {:ok, %User{} = user} = Profile.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.scopes == ["option1"]
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_user(user, @invalid_attrs)
      assert user == Profile.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Profile.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Profile.change_user(user)
    end
  end
end
