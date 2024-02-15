#include <array>
#include <chrono>
#include <iostream>
#include <memory>
#include <thread>

#ifdef __has_include
#  if __has_include(<optional>)
#    include <optional>
#    define have_optional 1
#  elif __has_include(<experimental/optional>)
#    include <experimental/optional>
#    define have_optional 1
#    define experimental_optional
#  else
#    define have_optional 0
#  endif
#endif

#ifdef have_optional
using MaybeString = std::optional<std::string>;
#endif

namespace detail
{
    /**
     * @brief Some boilerplate here and there
     * @author Some degenerate
     */
    class SoundCloudAudio
    {
    public:
        constexpr SoundCloudAudio() noexcept = default;

        /**
         * @brief This is a constructor
         * @param client_id  you guess id
         */
        explicit SoundCloudAudio(int client_id) noexcept : m_client_id(client_id)
        {}

        constexpr auto client_id() const noexcept
        {
            return m_client_id;
        }

        virtual bool playback() = 0;

    private:
        /// Here it is, the legend
        int m_client_id = 0;
    };
}

class SoundCloudAudio final : public detail::SoundCloudAudio
{
public:
    /// @brief Disable default constructor
    SoundCloudAudio() = delete;

    explicit SoundCloudAudio(int client_id) noexcept
        : detail::SoundCloudAudio(client_id)
        , m_array()
        , m_stop_after(std::chrono::seconds{10000})
        , m_early_exit(false)
    {
        m_array.fill(0.0F);
    }

    SoundCloudAudio(SoundCloudAudio const&) = delete;
    SoundCloudAudio(SoundCloudAudio&&) = delete;
    SoundCloudAudio& operator=(SoundCloudAudio const&) = delete;
    SoundCloudAudio& operator=(SoundCloudAudio&&) = delete;

    virtual ~SoundCloudAudio() = default;

    template <class Rep, class Period>
    void stop_after(std::chrono::duration<Rep, Period> duration)
    {
        m_stop_after = duration;
    }

    /**
     * @brief Play sound
     * @returns whether an early exit occurred
     */
    [[nodiscard]] bool playback() override
    {
        // reset flag
        m_early_exit = true;

        auto start_time = std::chrono::steady_clock::now();
        auto should_stop = [&, this]() -> bool {
            auto stop_time = std::chrono::steady_clock::now();
            auto elapsed = stop_time - start_time;
            return elapsed > m_stop_after; 
        };

        for (float val : m_array) {
            std::cout << this->client_id() << ": " << val << "\n";
            std::this_thread::sleep_for(std::chrono::milliseconds{100});
            if (should_stop()) {
                m_early_exit = true;
                break;
            }
        }

        return m_early_exit;
    }

private:
    static constexpr size_t kMaxsize {10U};

    std::array<float, kMaxsize> m_array;
    std::chrono::nanoseconds m_stop_after;
    bool m_early_exit;
};

enum class EnumType : std::uint8_t
{
    ALPHA = 0U,
    OMEGA = 255U,
};

std::pair<bool, std::string> take_this()
{
    return {false, "take_me"};
}

void i_got_that()
{
    try {
        auto const [ok, msg] = take_this();
        std::cout << "I got this " << msg << "\n";

        EnumType e {EnumType::ALPHA};
        switch (e)
        {
        case EnumType::ALPHA:
            std::cout << "alpha\n";
        case EnumType::OMEGA:
            [[fallthrough]];
        default:
            std::cout << "omega and beyond\n";
        }
    } catch (...) {
    }
}

int main()
{
    std::shared_ptr<detail::SoundCloudAudio> ptr;
    ptr.reset(new SoundCloudAudio{22});
    // do some magic just for fun
    auto audio = std::dynamic_pointer_cast<SoundCloudAudio>(ptr);

    audio->stop_after(std::chrono::seconds{2});
    std::ignore = audio->playback();
    static_cast<void>(audio->playback());
    bool const early_exit { audio->playback() };
    if (early_exit)  {
        std::cout << "early exit" << std::endl;
    }

    static_assert(!std::is_same_v<decltype(ptr), decltype(audio)>, "Of course they are different");

    i_got_that();
}
