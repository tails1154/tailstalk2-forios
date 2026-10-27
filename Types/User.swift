//
//  User.swift
//  Types
//
//  Created by Angelo on 19/05/2024.
//

import Foundation

public struct UserBot: Codable, Equatable, Hashable {
    public var owner: String
}

public enum Presence: String, Codable, Equatable, Hashable {
    case Busy
    case Idle
    case Invisible
    case Online
    case Focus
}

public enum Relation: String, Codable, Equatable, Hashable {
    case Blocked
    case BlockedOther
    case Friend
    case Incoming
    case None
    case Outgoing
    case User
}

public struct Status: Codable, Equatable, Hashable {
    public init(text: String? = nil, presence: Presence? = nil) {
        self.text = text
        self.presence = presence
    }
    
    public var text: String?
    public var presence: Presence?
}

public struct UserRelation: Codable, Equatable, Hashable, Identifiable {
    public var id: String
    public var status: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case status
    }
}

public struct User: Identifiable, Codable, Equatable, Hashable {
    public init(id: String, username: String, discriminator: String, display_name: String? = nil, avatar: File? = nil, relations: [UserRelation]? = nil, badges: Int? = nil, status: Status? = nil, relationship: Relation? = nil, online: Bool? = nil, flags: Int? = nil, bot: UserBot? = nil, privileged: Bool? = nil, profile: Profile? = nil) {
        self.id = id
        self.username = username
        self.discriminator = discriminator
        self.display_name = display_name
        self.avatar = avatar
        self.relations = relations
        self.badges = badges
        self.status = status
        self.relationship = relationship
        self.online = online
        self.flags = flags
        self.bot = bot
        self.privileged = privileged
        self.profile = profile
    }

    public var id: String
    public var username: String
    public var discriminator: String
    public var display_name: String?
    public var avatar: File?
    public var relations: [UserRelation]?
    public var badges: Int?
    public var status: Status?
    public var relationship: Relation?
    public var online: Bool?
    public var flags: Int?
    public var bot: UserBot?
    public var privileged: Bool?
    public var profile: Profile?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, discriminator, display_name, avatar, relations, badges, status, relationship, online, flags, bot, privileged
    }
}

public struct Profile: Codable, Equatable, Hashable {
    public init(content: String? = nil, background: File? = nil, avatar_decoration: String? = nil) {
        self.content = content
        self.background = background
        self.avatar_decoration = avatar_decoration
    }
    
    public var content: String?
    public var background: File?
    public var avatar_decoration: String?
}

public struct TailsTalkXP: Codable, Equatable, Hashable {
    public var xp: Int64
    public var level: Int64
    public var next_level_xp: Int64
    public var current_level_xp: Int64
}

public struct TailsTalkAvatarDecoration: Codable, Equatable, Hashable, Identifiable {
    public var id: String
    public var name: String
    public var asset_url: String
    public var price_xp: Int64
    public var enabled: Bool
    public var owned: Bool
    public var equipped: Bool
}

public struct TailsTalkBoost: Codable, Equatable, Hashable, Identifiable {
    public var id: String
    public var user_id: String
}

public struct TailsTalkBoostSummary: Codable, Equatable, Hashable {
    public var server_id: String
    public var boost_count: Int64
    public var level: Int
    public var next_level: Int?
    public var user_boosts: [TailsTalkBoost]
    public var available_premium_boosts: Int64
    public var user_level: Int64
    public var boost_cost_levels: Int64
    public var is_premium: Bool
    public var progress_enabled: Bool
    public var can_manage: Bool
}
